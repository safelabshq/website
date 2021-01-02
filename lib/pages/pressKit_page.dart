import 'package:flutter/material.dart';
import 'package:website/services/screenSizeIndicator.dart';
import 'package:website/widgets/navigationBar.dart';

class PressKitPage extends StatefulWidget {
  static String id = "pressKit_page";

  @override
  _PressKitPageState createState() => _PressKitPageState();
}

class _PressKitPageState extends State<PressKitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: Column(
              children: [
                NavigationBar(currentPage: CurrentPage.pressKit),
                Container(
                  height: ScreenSizeIndicator.getScreenSize(
                        context,
                        Axis.vertical,
                      ) -
                      80,
                  width: ScreenSizeIndicator.getScreenSize(
                        context,
                        Axis.horizontal,
                      ) *
                      0.5,
                  child: null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
