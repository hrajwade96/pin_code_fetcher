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
    Key? key,
    required TextEditingController searchController,
    required this.store,
    this.height,
    this.width,
  })  : _searchController = searchController,
        super(key: key);

  final TextEditingController _searchController;
  final LocationStore store;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFB2EBF2), Color(0xFF0288D1)], // Updated colors
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          // Overlaying with a pattern. This is just an example, and you might need to fetch a pattern of your choice.
          image: DecorationImage(
            image: const AssetImage(
                '/Users/hrishikeshrajwade/StudioProjects/pin_code_fetcher/pincode_fetcher/assets/template1.png'), // Replace with the path to your pattern image
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(
                  0.7), // Adjust this value to make the pattern more or less visible
              BlendMode.dstATop,
            ),
          ),
        ),
        child: SingleChildScrollView(
          // Add SingleChildScrollView
          padding: EdgeInsets.symmetric(
            horizontal:
                0.15 * width!, // Adjust the horizontal padding symmetrically
            vertical: 0.12 *
                height!, // You can also adjust the vertical padding as needed
          ),
          child: Column(children: [
            // Stylized Search Bar
            // Stylized Search Bar
            // Stylized Search Bar
            Center(
              child: Container(
                width: 0.6 * width!,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white
                      .withOpacity(0.5), // Adjust the opacity as needed
                  borderRadius:
                      BorderRadius.circular(25), // Optional rounded corners
                  border: Border.all(
                    color: Colors.white, // Color for the border
                    width: 1.0, // Width of the border
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  // Added this to center-align the TextField
                  child: TextField(
                    controller: _searchController,
                    style: const TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      hintText: 'Enter your pincode/state/city/area!',
                      suffixIcon: IconButton(
                        iconSize: 20, // Adjust as per requirement
                        icon: const Icon(Icons.clear),
                        onPressed: () => _searchController.clear(),
                      ),
                      prefixIcon: IconButton(
                        iconSize: 20, // Adjust as per requirement
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          store.count = 0;
                          store.searchQuery = _searchController.text;
                          if (store.searchQuery.isNotEmpty) {
                            store.fetchAddress(_searchController.text);
                          }
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0.0,
                          horizontal:
                              20.0), // Further adjusted for better alignment
                      isDense: true, // Added this to adjust vertical alignment
                      alignLabelWithHint: true, // Helpful if using labelText
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
                return Center(
                  // Wrap with Center widget to align the content
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment
                        .center, // To vertically center-align the items
                    children: [
                      LoadingAnimationWidget.discreteCircle(
                        color: Colors.red,
                        size: 50,
                      ),
                      const SizedBox(
                        height: 20, // Increase this value to add more space
                      ),
                      const Text('Loading...', style: TextStyle(fontSize: 35)),
                    ],
                  ),
                );
              }

              if (store.addressData.value?.status == FutureStatus.fulfilled) {
                if (data != null && data.results!.isNotEmpty) {
                  store.count = 0;
                  return Column(
                    children: [
                      const Center(
                        child: Text(
                          'Location Details',
                          style: TextStyle(
                            fontSize: 28, // Increased font size
                            fontWeight: FontWeight.w800,
                            color: Colors.white, // Set the text color to white
                            shadows: [
                              // Added shadow for a bit of depth
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 2.0,
                                color: Color.fromRGBO(0, 0, 0,
                                    0.25), // Shadow is now a semi-transparent black
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                          height:
                              20), // Added space between the text and the table
                      SizedBox(
                        height: 600,
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(
                                  0.5), // Adjust the opacity as needed
                              borderRadius: BorderRadius.circular(
                                  10), // Optional rounded corners
                              border: Border.all(
                                color: Colors.white, // Color for the border
                                width: 1.0, // Width of the border
                              ),
                            ),
                            child: GenerateAddressOutput(data: data)),
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    );
                  }
                }
              }
              return Container();
            }),
          ]),
        ),
      ),
    );
  }
}
