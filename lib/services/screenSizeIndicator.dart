import 'package:flutter/material.dart';

class ScreenSizeIndicator {
  static double getScreenSize(BuildContext context, Axis axis) {
    MediaQueryData data = MediaQuery.of(context);

    return axis == Axis.vertical
        ? data.size.height
        : axis == Axis.horizontal
            ? data.size.width
            : null;
  }
}
