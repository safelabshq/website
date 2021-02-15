import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:website/utils/constants.dart';

class NavigationIndex extends StatefulWidget {
  NavigationIndex({this.text, this.width, this.onTap});

  final String text;
  final double width;
  final Function onTap;

  @override
  _NavigationIndexState createState() => _NavigationIndexState();
}

class _NavigationIndexState extends State<NavigationIndex> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onHover: (PointerEvent details) {
          setState(() {
            isActive = true;
          });
        },
        onExit: (PointerEvent details) {
          setState(() {
            isActive = false;
          });
        },
        child: Container(
          height: 50,
          width: widget.width,
          decoration: BoxDecoration(
            color: isActive
                ? kActiveTextColor.withOpacity(0.03)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(
              widget.text,
              style: kNavigationBarText.copyWith(
                color: isActive ? kActiveTextColor : kRegularTextColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
