import 'package:flutter/material.dart';
import 'package:website/widgets/barHighlight.dart';

enum HSector {
  trueDocumentation,
  notifyContacts,
  uploadsCloud,
  lowersBrightness,
}

Map<HSector, double> margins = {
  HSector.trueDocumentation: 0,
  HSector.notifyContacts: 200,
  HSector.uploadsCloud: 300,
  HSector.lowersBrightness: 400,
};

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
  bool isReverse;
  double startHeight;
  double endHeight;
  double lowerBound;

  void initializeValues(HSector start, HSector end) {
    lowerBound = 0;
    upperBound = 0;
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
        isReverse = false;
        startHeight = 100;

        margin = margins[HSector.trueDocumentation];
        switch (end) {
          case HSector.trueDocumentation:
            upperBound = margins[HSector.trueDocumentation];
            break;
          case HSector.notifyContacts:
            upperBound = margins[HSector.notifyContacts];
            break;
          case HSector.uploadsCloud:
            upperBound = margins[HSector.uploadsCloud];
            break;
          case HSector.lowersBrightness:
            upperBound = margins[HSector.lowersBrightness];
            break;
        }
        break;
      case HSector.notifyContacts:
        isReverse = false;
        margin = margins[HSector.notifyContacts];
        switch (end) {
          case HSector.trueDocumentation:
            upperBound = margins[HSector.trueDocumentation];
            isReverse = true;
            break;
          case HSector.notifyContacts:
            upperBound = margins[HSector.notifyContacts];
            break;
          case HSector.uploadsCloud:
            upperBound = margins[HSector.uploadsCloud];
            break;
          case HSector.lowersBrightness:
            upperBound = margins[HSector.lowersBrightness];
            break;
        }
        break;
      case HSector.uploadsCloud:
        isReverse = false;
        margin = margins[HSector.uploadsCloud];
        switch (end) {
          case HSector.trueDocumentation:
            upperBound = margins[HSector.trueDocumentation];
            isReverse = true;
            break;
          case HSector.notifyContacts:
            isReverse = true;
            upperBound = margins[HSector.notifyContacts];
            break;
          case HSector.uploadsCloud:
            upperBound = margins[HSector.uploadsCloud];
            break;
          case HSector.lowersBrightness:
            upperBound = margins[HSector.lowersBrightness];
            break;
        }
        break;
      case HSector.lowersBrightness:
        isReverse = true;
        margin = margins[HSector.lowersBrightness];
        switch (end) {
          case HSector.trueDocumentation:
            upperBound = margins[HSector.trueDocumentation];
            break;
          case HSector.notifyContacts:
            upperBound = margins[HSector.notifyContacts];
            break;
          case HSector.uploadsCloud:
            upperBound = margins[HSector.uploadsCloud];
            break;
          case HSector.lowersBrightness:
            isReverse = false;
            upperBound = margins[HSector.lowersBrightness];
            break;
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
      lowerBound: lowerBound,
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
        setState(() {
          print(motionController.value);
        });
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
        isReverse ? motionController.reverse() : motionController.forward();
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
