import 'package:flutter/material.dart';
import 'package:website/utils/constants.dart';
import 'package:website/widgets/navigationIndex.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  Color homeTextColor = kRegularTextColor;
  Color twitterTextColor = kRegularTextColor;
  Color pressTextColor = kRegularTextColor;
  Color betaTextColor = kRegularTextColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: 40,
          ),
          Container(
            child: Row(
              children: [
                NavigationIndex(text: "Home", color: homeTextColor),
                SizedBox(width: 5),
                NavigationIndex(text: "Twitter", color: twitterTextColor),
                SizedBox(width: 5),
                NavigationIndex(text: "Press Kit", color: pressTextColor),
                SizedBox(width: 5),
                NavigationIndex(text: "Join Beta", color: betaTextColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
