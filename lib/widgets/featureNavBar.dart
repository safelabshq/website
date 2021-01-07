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
  HSector.notifyContacts: 140,
  HSector.uploadsCloud: 305,
  HSector.lowersBrightness: 470,
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
  double upperBound = 700;
  bool isReverse;
  double startHeight;
  double endHeight;
  double lowerBound = 0;

  void initializeValues(HSector start, HSector end) {
    switch (end) {
      case HSector.trueDocumentation:
        endHeight = 350;
        break;
      case HSector.lowersBrightness:
        endHeight = 400;
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
        print(1);
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
        print(2);
        isReverse = false;
        startHeight = 100;
        margin = margins[HSector.notifyContacts];
        switch (end) {
          case HSector.trueDocumentation:
            lowerBound = margins[HSector.trueDocumentation];
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
        print(3);
        isReverse = false;
        startHeight = 100;
        margin = margins[HSector.uploadsCloud];
        switch (end) {
          case HSector.trueDocumentation:
            lowerBound = margins[HSector.trueDocumentation];
            isReverse = true;
            break;
          case HSector.notifyContacts:
            isReverse = true;
            lowerBound = margins[HSector.notifyContacts];
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
        print(4);
        isReverse = true;
        startHeight = 100;
        margin = margins[HSector.lowersBrightness];
        switch (end) {
          case HSector.trueDocumentation:
            lowerBound = margins[HSector.trueDocumentation];
            break;
          case HSector.notifyContacts:
            lowerBound = margins[HSector.notifyContacts];
            break;
          case HSector.uploadsCloud:
            lowerBound = margins[HSector.uploadsCloud];
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
        print("here");
        isReverse ? motionController.reverse() : motionController.forward();
        // heightController.forward();
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
              margin: motionController.value,
            ),
          ],
        ),
      ),
    );
  }
}
