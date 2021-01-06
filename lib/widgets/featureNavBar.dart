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
    with TickerProviderStateMixin {
  AnimationController motionController;
  AnimationController heightController;

  double margin;
  double upperBound;
  double startHeight;
  double endHeight;

  void initializeValues(HSector start, HSector end) {
    switch (end) {
      case HSector.trueDocumentation:
        endHeight = 200;
        break;
      case HSector.lowersBrightness:
        endHeight = 250;
        break;
      case HSector.notifyContacts:
        endHeight = 210;
        break;
      case HSector.uploadsCloud:
        endHeight = 100;
        break;
    }

    switch (start) {
      case HSector.trueDocumentation:
        startHeight = 100;
        margin = 0;
        switch (end) {
          case HSector.trueDocumentation:
            upperBound = 0;
            break;
          case HSector.notifyContacts:
            upperBound = 200;
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
    motionController = AnimationController(
      vsync: this,
      value: margin,
      upperBound: upperBound,
      duration: Duration(milliseconds: 500),
    );

    heightController = AnimationController(
      vsync: this,
      value: startHeight,
      upperBound: endHeight,
      duration: Duration(milliseconds: 500),
    );

    heightController.addListener(
      () {
        setState(() {});
      },
    );

    motionController.addListener(
      () {
        setState(() {});
      },
    );

    super.initState();
  }

  double getHeight() {
    if (startHeight < endHeight) {
      return startHeight > heightController.value
          ? startHeight
          : heightController.value;
    } else {
      return startHeight < heightController.value
          ? startHeight
          : heightController.value;
    }
  }

  @override
  void dispose() {
    motionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        motionController.forward();
        heightController.forward();
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
              height: getHeight(),
              margin: margin != motionController.value
                  ? motionController.value
                  : margin,
            ),
          ],
        ),
      ),
    );
  }
}
