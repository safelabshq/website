import 'package:flutter/material.dart';
import 'package:website/utils/constants.dart';
import 'package:website/widgets/navigationBar.dart';

class Hook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 900,
      width: double.infinity,
      color: kPrimaryBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          NavigationBar(),
        ],
      ),
    );
  }
}
