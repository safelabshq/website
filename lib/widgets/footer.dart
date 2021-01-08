import 'package:flutter/material.dart';
import 'package:website/utils/constants.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      color: kTerciaryBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "mark@safelabs.app | Built and maintained with love by the Safe team in San Jose.",
            style: TextStyle(
              fontFamily: "SF_Pro",
              fontSize: 17,
            ),
          )
        ],
      ),
    );
  }
}
