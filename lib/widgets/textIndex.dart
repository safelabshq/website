import 'package:flutter/material.dart';

class TextIndex extends StatelessWidget {
  final bool isActive;
  final List<String> message;
  final double width;

  TextIndex({
    @required this.isActive,
    @required this.message,
    @required this.width,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message[0],
            style: TextStyle(
              color: isActive ? Color(0xffb5b5b5) : Color(0xff232323),
              fontSize: 27,
              letterSpacing: -0.5,
              fontFamily: "SF_Pro_Bold",
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            message[1],
            style: TextStyle(
              color: isActive ? Color(0xffb5b5b5) : Color(0xff232323),
              fontSize: 18,
              fontFamily: "SF_Pro",
            ),
          ),
        ],
      ),
    );
  }
}
