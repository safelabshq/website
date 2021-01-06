import 'package:flutter/material.dart';
import 'package:website/widgets/barHighlight.dart';

enum HSector {
  trueDocumentation,
  notifyContacts,
  uploadsCloud,
  lowersBrightness,
}

class FeatureNavBar extends StatefulWidget {
  final HSector start;
  final HSector end;

  FeatureNavBar({@required this.start, @required this.end});

  @override
  _FeatureNavBarState createState() => _FeatureNavBarState();
}

class _FeatureNavBarState extends State<FeatureNavBar>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  double margin;
  double value;
  double upperBound;

  void initializeValues(
    HSector start,
    HSector end,
  ) {
    switch (start) {
      case HSector.trueDocumentation:
        margin = 0;
        value = 0;
        switch (end) {
          case HSector.trueDocumentation:
            upperBound = 0;
            break;
          case HSector.notifyContacts:
            upperBound = 9;
            break;
          case HSector.uploadsCloud:
            upperBound = 200;
            break;
          case HSector.lowersBrightness:
            upperBound = 300;
            break;
        }
        break;
      case HSector.notifyContacts:
        margin = 100;
        value = 0;
        switch (end) {
          case HSector.trueDocumentation:
            upperBound = 0;
            break;
          case HSector.notifyContacts:
            break;
          case HSector.uploadsCloud:
            break;
          case HSector.lowersBrightness:
        }
        break;
      case HSector.uploadsCloud:
        margin = 100;
        value = 0;
        switch (end) {
          case HSector.trueDocumentation:
            upperBound = 0;
            break;
          case HSector.notifyContacts:
            break;
          case HSector.uploadsCloud:
            break;
          case HSector.lowersBrightness:
        }
        break;
      case HSector.lowersBrightness:
        margin = 100;
        value = 0;
        switch (end) {
          case HSector.trueDocumentation:
            upperBound = 0;
            break;
          case HSector.notifyContacts:
            break;
          case HSector.uploadsCloud:
            break;
          case HSector.lowersBrightness:
        }
        break;
    }
  }

  @override
  void initState() {
    // Initialize Values
    initializeValues(widget.start, widget.end);

    // Animation
    controller = AnimationController(
      vsync: this,
      value: value,
      upperBound: upperBound,
      duration: Duration(milliseconds: 500),
    );

    controller.addListener(
      () {
        setState(() {});
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.forward();
      },
      child: SizedBox(
        width: 7,
        height: 570,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            BarHighlight(
              height: 100,
              margin: margin != controller.value ? controller.value : margin,
            ),
          ],
        ),
      ),
    );
  }
}
