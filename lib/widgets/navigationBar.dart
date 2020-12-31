import 'package:flutter/material.dart';
import 'package:website/utils/constants.dart';

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
                Text(
                  "Home",
                  style: kNavigationBarText.copyWith(
                    color: homeTextColor,
                  ),
                ),
                SizedBox(width: 25),
                Text(
                  "Twitter",
                  style: kNavigationBarText.copyWith(
                    color: twitterTextColor,
                  ),
                ),
                SizedBox(width: 25),
                Text(
                  "Press Kit",
                  style: kNavigationBarText.copyWith(
                    color: pressTextColor,
                  ),
                ),
                SizedBox(width: 25),
                Text(
                  "Join Beta",
                  style: kNavigationBarText.copyWith(
                    color: betaTextColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
