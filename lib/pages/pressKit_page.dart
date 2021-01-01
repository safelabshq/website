import 'package:flutter/material.dart';
import 'package:website/widgets/navigationBar.dart';

class PressKitPage extends StatelessWidget {
  static String id = "pressKit_page";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: Column(
              children: [
                NavigationBar(currentPage: CurrentPage.pressKit),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
