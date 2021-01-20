import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/services/screenSizeIndicator.dart';
import 'package:website/utils/constants.dart';
import 'package:website/widgets/hookButton.dart';
import 'package:website/widgets/navigationBar.dart';

class Hook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      color: kPrimaryBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ScreenSizeIndicator.getScreenSize(context, Axis.horizontal) >= 600
              ? NavigationBar(currentPage: CurrentPage.home)
              : Container(),
          SizedBox(height: 60),
          AutoSizeText(
            "Meet Safe.",
            maxLines: 1,
            style: kHeader1,
          ),
          SizedBox(height: 25),
          Text(
            "A powerful tool for personal and community safety.",
            textAlign: TextAlign.center,
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
                  activeColor: Color(0xff99FFE5),
                  onTap: () {
                    launch("https://registersafebeta.typeform.com/to/jJ7yDJ9T");
                  },
                ),
                SizedBox(width: 38),
                HookButton(
                  text: "View Press Kit",
                  shadowColor: Color(0xff606060),
                  inactiveColor: kTerciaryBackgroundColor,
                  activeColor: Color(0xffeeeeee),
                  onTap: () {
                    launch('https://presskit.safelabs.app/');
                  },
                ),
              ],
            ),
          ),
          Image.asset(
            "assets/images/home.webp",
            width: ScreenSizeIndicator.getScreenSize(
                  context,
                  Axis.horizontal,
                ) *
                0.7,
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
