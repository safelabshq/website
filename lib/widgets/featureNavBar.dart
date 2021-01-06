import 'package:flutter/material.dart';
import 'package:website/utils/constants.dart';

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
  AnimationController controller;
  double margin;
  double lowerBound;
  double upperBound;

  void selectHighlight(
    HSector start,
    HSector end,
  ) {
    switch (start) {
      case HSector.trueDocumentation:
        margin = 100;
        lowerBound = 0;
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
      case HSector.notifyContacts:
        margin = 100;
        lowerBound = 0;
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
        lowerBound = 0;
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
        lowerBound = 0;
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
    controller = AnimationController(
      vsync: this,
      lowerBound: lowerBound,
      upperBound: upperBound,
      duration: Duration(milliseconds: 100),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
        ],
      ),
    );
  }
}
