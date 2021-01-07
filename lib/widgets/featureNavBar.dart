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
  HSector.notifyContacts: 145,
  HSector.uploadsCloud: 305,
  HSector.lowersBrightness: 470,
};

Map<HSector, double> heights = {
  HSector.trueDocumentation: 100,
  HSector.notifyContacts: 120,
  HSector.uploadsCloud: 125,
  HSector.lowersBrightness: 40,
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
  bool isHeightReverse;
  double startHeight;
  double endHeight;
  double lowerBound = 0;

  void initializeHeightValues(HSector start, HSector end) {
    switch (start) {
      case HSector.trueDocumentation:
        isHeightReverse = false;
        startHeight = heights[HSector.trueDocumentation];
        switch (end) {
          case HSector.trueDocumentation:
            endHeight = heights[HSector.trueDocumentation];
            break;
          case HSector.lowersBrightness:
            endHeight = heights[HSector.lowersBrightness];
            break;
          case HSector.notifyContacts:
            endHeight = heights[HSector.notifyContacts];
            break;
          case HSector.uploadsCloud:
            endHeight = heights[HSector.uploadsCloud];
            break;
        }
        break;
      case HSector.lowersBrightness:
        isHeightReverse = false;
        startHeight = heights[HSector.lowersBrightness];
        switch (end) {
          case HSector.trueDocumentation:
            isHeightReverse = true;
            endHeight = heights[HSector.trueDocumentation];
            break;
          case HSector.lowersBrightness:
            endHeight = heights[HSector.lowersBrightness];
            break;
          case HSector.notifyContacts:
            endHeight = heights[HSector.notifyContacts];
            break;
          case HSector.uploadsCloud:
            endHeight = heights[HSector.uploadsCloud];
            break;
        }
        break;
      case HSector.notifyContacts:
        isHeightReverse = false;
        startHeight = heights[HSector.notifyContacts];
        switch (end) {
          case HSector.trueDocumentation:
            isHeightReverse = true;
            endHeight = heights[HSector.trueDocumentation];
            break;
          case HSector.lowersBrightness:
            isHeightReverse = true;
            endHeight = heights[HSector.lowersBrightness];
            break;
          case HSector.notifyContacts:
            endHeight = heights[HSector.notifyContacts];
            break;
          case HSector.uploadsCloud:
            endHeight = heights[HSector.uploadsCloud];
            break;
        }
        break;
      case HSector.uploadsCloud:
        isHeightReverse = true;
        startHeight = heights[HSector.uploadsCloud];
        switch (end) {
          case HSector.trueDocumentation:
            endHeight = heights[HSector.trueDocumentation];
            break;
          case HSector.lowersBrightness:
            endHeight = heights[HSector.lowersBrightness];
            break;
          case HSector.notifyContacts:
            endHeight = heights[HSector.notifyContacts];
            break;
          case HSector.uploadsCloud:
            isHeightReverse = false;
            endHeight = heights[HSector.uploadsCloud];
            break;
        }
        break;
    }
  }

  void initializeMotionValues(HSector start, HSector end) {
    switch (start) {
      case HSector.trueDocumentation:
        print(1);
        isReverse = false;

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
    initializeMotionValues(widget.start, widget.end);
    initializeHeightValues(widget.start, widget.end);

    // Animation
    motionController = AnimationController(
      vsync: this,
      value: margin,
      lowerBound: lowerBound,
      upperBound: upperBound,
      duration: Duration(milliseconds: 250),
    );
    heightController = AnimationController(
      vsync: this,
      lowerBound: isHeightReverse ? endHeight : startHeight,
      value: startHeight,
      upperBound: isHeightReverse ? 700 : endHeight,
      duration: Duration(milliseconds: 250),
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
        isReverse ? motionController.reverse() : motionController.forward();
        isHeightReverse
            ? heightController.reverse()
            : heightController.forward();
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
              height: heightController.value,
              margin: motionController.value,
            ),
          ],
        ),
      ),
    );
  }
}
