import 'package:flutter/material.dart';

class TextIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "True Documentation",
          style: TextStyle(
            color: Color(0xff232323),
            fontSize: 27,
            letterSpacing: 0.3,
            fontFamily: "SF_Pro_Bold",
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Both front and back camera will automatically start recording. Your exact location will also be documented.",
          style: TextStyle(
            color: Color(0xff232323),
            fontSize: 15,
            letterSpacing: 0.3,
            fontFamily: "SF_Pro",
          ),
        ),
      ],
    );
  }
}
