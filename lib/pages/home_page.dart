import 'package:flutter/material.dart';
import 'package:website/widgets/featureListing.dart';
import 'package:website/widgets/footer.dart';
import 'package:website/widgets/hook.dart';
import 'package:website/widgets/signPrompt.dart';

class HomePage extends StatefulWidget {
  static String id = 'home_page';
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
          Hook(),
          FeatureListing(),
          SignPrompt(),
          Footer(),
        ],
      ),
    );
  }
}
