import 'package:flutter/material.dart';
import 'package:website/utils/constants.dart';

class BarHighlight extends StatelessWidget {
  final double height;
  final double margin;

  BarHighlight({this.height, this.margin});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.only(top: margin ?? 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kAccentColor,
      ),
    );
  }
}
