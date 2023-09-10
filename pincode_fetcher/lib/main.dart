import 'package:flutter/material.dart';
import 'package:pincode_fetcher/pages/landing_page.dart';
// ignore: depend_on_referenced_packages

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pin code Fetcher',
      theme: ThemeData(
        textTheme: const TextTheme(
            // bodyText2: TextStyle(color: Colors.red, fontWeight: FontWeight.w900),
            ),
      ),
      home: const MyHomePage(title: 'Pin code Fetcher'),
    );
  }
}
