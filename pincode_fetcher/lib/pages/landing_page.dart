import 'package:flutter/material.dart';
import 'package:pincode_fetcher/stores/view_port_store.dart';
import '../stores/location_store.dart';
import '../widgets/views/desktop.dart';

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
    final viewport = ViewportStore();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pincode Fetcher'),
      ),
      body: Center(
          child:
              DesktopView(searchController: _searchController, store: store)),
    );
  }
}
