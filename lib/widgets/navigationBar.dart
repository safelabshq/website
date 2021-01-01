import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/pages/home_page.dart';
import 'package:website/pages/pressKit_page.dart';
import 'package:website/widgets/navigationIndex.dart';

enum CurrentPage {
  home,
  pressKit,
}

class NavigationBar extends StatefulWidget {
  final CurrentPage currentPage;

  NavigationBar({@required this.currentPage});
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "navigation_bar",
      child: Container(
        height: 80,
        width: double.infinity,
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
                      if (widget.currentPage == CurrentPage.home) {
                        print("already in home page");
                      } else {
                        Navigator.pushNamed(context, HomePage.id);
                      }
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
                    onTap: () {
                      if (widget.currentPage == CurrentPage.pressKit) {
                        print("already in press kit page");
                      } else {
                        Navigator.pushNamed(context, PressKitPage.id);
                      }
                    },
                  ),
                  SizedBox(width: 10),
                  NavigationIndex(
                    text: "Join Beta",
                    width: 95,
                    onTap: () async {
                      launch(
                          "https://registersafebeta.typeform.com/to/jJ7yDJ9T");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
