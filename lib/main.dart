import 'package:flutter/material.dart';
import 'package:website/pages/home_page.dart';
import 'package:website/pages/pressKit_page.dart';

void main() {
  runApp(SafeWebsite());
}

class SafeWebsite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => HomePage(),
        PressKitPage.id: (context) => PressKitPage(),
      },
    );
  }
}
