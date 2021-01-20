import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/pages/home_page.dart';
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
            GestureDetector(
              onTap: () {
                if (widget.currentPage == CurrentPage.home) {
                  print("already in home page");
                } else {
                  Navigator.pushNamed(context, HomePage.id);
                }
              },
              child: Image.asset(
                'assets/images/logo.png',
                height: 40,
              ),
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
                    onTap: () {
                      launch("https://twitter.com/SafeLabsHQ");
                    },
                  ),
                  SizedBox(width: 10),
                  NavigationIndex(
                    text: "Press Kit",
                    width: 95,
                    onTap: () {
                      launch('https://safelabshq.github.io/press_kit/');
                    },
                  ),
                  SizedBox(width: 10),
                  NavigationIndex(
                    text: "Join Beta",
                    width: 95,
                    onTap: () {
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
