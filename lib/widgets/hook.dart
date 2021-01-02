import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/pages/pressKit_page.dart';
import 'package:website/services/screenSizeIndicator.dart';
import 'package:website/utils/constants.dart';
import 'package:website/widgets/hookButton.dart';
import 'package:website/widgets/navigationBar.dart';

class Hook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: kPrimaryBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NavigationBar(
            currentPage: CurrentPage.home,
          ),
          SizedBox(height: 60),
          Text(
            "Meet Safe.",
            style: kHeader1,
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
                    Navigator.pushNamed(context, PressKitPage.id);
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
