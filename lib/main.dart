import 'package:flutter/material.dart';
import 'package:website/pages/home_page.dart';

void main() {
  runApp(SafeWebsite());
}

class SafeWebsite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
