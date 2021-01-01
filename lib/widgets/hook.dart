import 'package:flutter/material.dart';
import 'package:website/utils/constants.dart';
import 'package:website/widgets/hookButton.dart';
import 'package:website/widgets/navigationBar.dart';

class Hook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 900,
      width: double.infinity,
      color: kPrimaryBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NavigationBar(),
          SizedBox(height: 60),
          Text(
            "Meet Safe.",
            style: TextStyle(
              color: kRegularTextColor,
              fontFamily: "SF_Pro_Bold",
              fontSize: 70,
            ),
          ),
          SizedBox(height: 25),
          Text(
            "A powerful tool for personal and community safety.",
            style: TextStyle(
              fontSize: 33,
              fontFamily: "SF_Pro",
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HookButton(
                  text: "Join Beta",
                  shadowColor: kAccentColor,
                  inactiveColor: kAccentColor,
                ),
                SizedBox(width: 38),
                HookButton(
                  text: "View Press Kit",
                  shadowColor: Color(0xff606060),
                  inactiveColor: kTerciaryBackgroundColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
