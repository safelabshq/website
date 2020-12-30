import 'package:flutter/material.dart';
import 'package:website/utils/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            height: 900,
            width: double.infinity,
            color: kPrimaryBackgroundColor,
          ),
          Container(
            height: 1000,
            width: double.infinity,
            color: kSecondaryBackgroundColor,
          ),
          Container(
            height: 425,
            width: double.infinity,
            color: kPrimaryBackgroundColor,
          ),
          Container(
            height: 100,
            width: double.infinity,
            color: kTerciaryBackgroundColor,
          ),
        ],
      ),
    );
  }
}
