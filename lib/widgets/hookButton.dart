import 'package:flutter/material.dart';
import 'package:website/utils/constants.dart';

class HookButton extends StatefulWidget {
  final Color shadowColor;
  final Color inactiveColor;
  final Color activeColor;
  final String text;

  HookButton({
    @required this.shadowColor,
    this.text,
    this.activeColor,
    this.inactiveColor,
  });
  @override
  _HookButtonState createState() => _HookButtonState();
}

class _HookButtonState extends State<HookButton>
    with SingleTickerProviderStateMixin {
  Color color;
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    // Animation Initialization
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    animation = ColorTween(begin: widget.inactiveColor, end: widget.activeColor)
        .animate(controller);

    // State Initialization
    color = widget.inactiveColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 170,
      child: Center(
        child: Text(
          widget.text,
          style: kButtonTextStyle,
        ),
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: widget.shadowColor.withOpacity(0.3),
            offset: Offset(0, 0),
            blurRadius: 5,
            spreadRadius: 1,
          )
        ],
      ),
    );
  }
}
