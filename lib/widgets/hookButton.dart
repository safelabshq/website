import 'package:flutter/material.dart';

class HookButton extends StatefulWidget {
  final Color shadowColor;
  final Color inactiveColor;
  final Color activeColor;

  HookButton({
    @required this.shadowColor,
    this.activeColor,
    this.inactiveColor,
  });
  @override
  _HookButtonState createState() => _HookButtonState();
}

class _HookButtonState extends State<HookButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: widget.shadowColor.withOpacity(0.4),
            offset: Offset(0, 0),
            blurRadius: 5,
            spreadRadius: 1,
          )
        ],
      ),
    );
  }
}
