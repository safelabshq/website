import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/utils/constants.dart';
import 'package:website/widgets/hookButton.dart';

class SignPrompt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      color: kPrimaryBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Always be prepared with Safe.",
            style: kHeader1.copyWith(
              fontSize: 50,
            ),
          ),
          SizedBox(height: 30),
          HookButton(
            text: "Join Beta",
            shadowColor: kAccentColor,
            inactiveColor: kAccentColor,
            activeColor: Color(0xff99FFE5),
            onTap: () {
              launch("https://registersafebeta.typeform.com/to/jJ7yDJ9T");
            },
          ),
        ],
      ),
    );
  }
}
