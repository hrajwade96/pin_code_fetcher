import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mobx/mobx.dart';

import '../../stores/location_store.dart';
import '../output.dart';

class DesktopView extends StatelessWidget {
  double? height;
  double? width;
  DesktopView({
    super.key,
    required TextEditingController searchController,
    required this.store,
    this.height,
    this.width,
  }) : _searchController = searchController;

  final TextEditingController _searchController;
  final LocationStore store;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.sizeOf(context).height;
    width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.fromLTRB(
          0.1 * width!.toDouble(), 0, ((0.2 * width!.toDouble())), 0),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 32.0),
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
          if (store.addressData.value?.status == FutureStatus.pending) {
            debugPrint(
                'Loading Widget.${DateTime.now().millisecondsSinceEpoch}');
            return Stack(children: [
              SizedBox(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.sizeOf(context).height * 0.25),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.sizeOf(context).aspectRatio * 2.45),
                          child: LoadingAnimationWidget.discreteCircle(
                            color: Colors.red,
                            size: 50,
                          ),
                        ),
                        if (MediaQuery.sizeOf(context).width > 1024)
                          Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.sizeOf(context).aspectRatio * 3.45),
                            child: const Text('Loading...',
                                style: TextStyle(fontSize: 35)),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ]);
          }

          debugPrint('data is $data');
          if (store.addressData.value?.status == FutureStatus.fulfilled) {
            debugPrint(
                'Finished Widget.${DateTime.now().millisecondsSinceEpoch}');
            if (data != null && data.results!.isNotEmpty) {
              store.count = 0;
              return Column(
                children: [
                  const Center(
                      child: SizedBox(
                    child: Text(
                      'Location Details',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  )),
                  SizedBox(
                    height: 600,
                    child: GenerateAddressOutput(data: data),
                  ),
                ],
              );
            } else {
              if (store.count < 5) {
                store.fetchAddress(_searchController.text);
              } else {
                return const Center(
                  child: Text(
                    'No results found!',
                    style: TextStyle(fontSize: 20),
                  ),
                );
              }
              return Container();
            }
          }
          return Container();
        }),
      ]),
    );
  }
}
