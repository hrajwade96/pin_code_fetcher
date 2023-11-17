import 'package:flutter/material.dart';

import '../pages/about_us.dart';
import '../pages/landing_page.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.blueGrey,
    title: const Text('Pincode Fetcher'),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const MyHomePage(title: 'Pin code Fetcher')));
        },
        child: const Text(
          'Home',
          style: TextStyle(
            color: Colors.white, // You can add more styling as per your need
          ),
        ),
      ),
      TextButton(
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AboutUs()));
        },
        child: const Text(
          'About Us',
          style: TextStyle(
            color: Colors.white, // You can add more styling as per your need
          ),
        ),
      ),
//TODO uncomment and add Help
/*      TextButton(
        onPressed:(){
          Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Help()));
        },
        child: const Text(
          'Help',
          style: TextStyle(
            color: Colors.white, // You can add more styling as per your need
          ),
        ),
      ),*/
    ],
  );
}
