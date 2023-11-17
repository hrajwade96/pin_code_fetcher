import 'package:flutter/material.dart';
import 'package:pincode_fetcher/util/about_us_text.dart';

import '../appbars/common_appbar.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: SelectableText.rich(
          TextSpan(text: DisclaimerText.disclaimer),
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
