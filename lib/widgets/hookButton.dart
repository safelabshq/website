import 'package:flutter/material.dart';
import 'package:website/utils/constants.dart';

class HookButton extends StatefulWidget {
  final Color shadowColor;
  final Color inactiveColor;
  final Color activeColor;
  final String text;
  final Function onTap;

  HookButton({
    @required this.shadowColor,
    this.text,
    this.onTap,
    this.activeColor,
    this.inactiveColor,
  });
  @override
  _HookButtonState createState() => _HookButtonState();
}

class _HookButtonState extends State<HookButton> with TickerProviderStateMixin {
  Color color;
  AnimationController controller;
  Animation animation;
  bool active;

  @override
  void initState() {
    super.initState();

    // State Initialization
    color = widget.inactiveColor;
    active = false;
  }

  void animate() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );

    if (!active) {
      animation =
          ColorTween(begin: widget.activeColor, end: widget.inactiveColor)
              .animate(controller);
    } else if (active) {
      animation =
          ColorTween(begin: widget.inactiveColor, end: widget.activeColor)
              .animate(controller);
    }

    controller.forward();

    controller.addListener(() {
      setState(() {
        print(active);
        color = animation.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (PointerEvent _) async {
          setState(() {
            active = !active;
          });
          animate();
        },
        onExit: (PointerEvent _) {
          setState(() {
            active = !active;
          });
          animate();
        },
        child: Container(
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
        ),
      ),
    );
  }
}
