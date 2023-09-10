import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../stores/location_store.dart';
import '../widgets/output.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String s1 = '';

  // This controller will store the value of the search bar
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final store = LocationStore();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pincode Fetcher'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(MediaQuery.sizeOf(context).width*0.2, 0, MediaQuery.sizeOf(context).width*0.2, 0),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top:32.0),
            child: Container(
              // Add padding around the search bar
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              // Use a Material design search bar
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  // Add a clear button to the search bar
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () => _searchController.clear(),
                  ),
                  // Add a search icon or button to the search bar
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        // Perform the search here
                        store.count = 0;
                        store.searchQuery = _searchController.text;
                        store.fetchAddress(_searchController.text);
                      },
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Observer(builder: (context) {
            final data = store.addressData.value?.value;
            debugPrint('data is $data');
            if (store.addressData.value?.status == FutureStatus.fulfilled) {
              if (data != null && data.results!.length > 0) {
                store.count = 0;
                return SizedBox(
                  height: 500,
                  child: GenerateAddressOutput(data: data),
                );
              } else {
                if (store.count < 5) {
                  store.fetchAddress(_searchController.text);
                }else{
                  return Center(child: Text('No results found!',style: TextStyle(fontSize: 20),),);
                }
                return Container();
              }
            }
            return Container();
          }),
        ]),
      ),
    );
  }
}
