import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/pages/home_page.dart';
import 'package:website/utils/constants.dart';
import 'package:website/widgets/navigationIndex.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
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
                NavigationIndex(
                  text: "Home",
                  width: 70,
                  onTap: () {
                    Navigator.pushNamed(context, HomePage.id);
                  },
                ),
                SizedBox(width: 10),
                NavigationIndex(
                  text: "Twitter",
                  width: 80,
                  onTap: () async {
                    launch("https://twitter.com/SafeLabsHQ");
                  },
                ),
                SizedBox(width: 10),
                NavigationIndex(
                  text: "Press Kit",
                  width: 95,
                ),
                SizedBox(width: 10),
                NavigationIndex(
                  text: "Join Beta",
                  width: 95,
                  onTap: () async {
                    launch("https://registersafebeta.typeform.com/to/jJ7yDJ9T");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
