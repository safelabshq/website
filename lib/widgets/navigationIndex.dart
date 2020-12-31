import 'package:flutter/material.dart';
import 'package:website/utils/constants.dart';

class NavigationIndex extends StatelessWidget {
  NavigationIndex({@required this.color, this.text});

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Text(
          text,
          style: kNavigationBarText.copyWith(
            color: color,
          ),
        ),
      ),
    );
  }
}
