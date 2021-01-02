import 'package:flutter/material.dart';
import 'package:website/services/screenSizeIndicator.dart';

class FeatureRow extends StatefulWidget {
  @override
  _FeatureRowState createState() => _FeatureRowState();
}

class _FeatureRowState extends State<FeatureRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: ScreenSizeIndicator.getScreenSize(context, Axis.horizontal) * 0.7,
      child: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.blue,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
