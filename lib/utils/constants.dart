import 'package:flutter/material.dart';

// Content
const String markdownData = '''
  # Press Kit

  __At its core, Safe is an app that allows users to easily document events where they may be in harms way. A simple press of a button is all it takes to activate it.__

This means that anyone with Safe has the power to document and record everything from police encounters to domestic violence. Encounters recorded with Safe are immediately uploaded to the cloud allowing users to access everything from any smartphone. 

One of Safe's primary strengths is the ability to do everything at once. With the simple press of a button, Safe will automatically take care of everything needed to ensure the documentation of a potentially dangerous event. This allows our users to forget about having to document said event. The last thing that you want to worry about being in a situation like this is having to record all of it properly.

  > For example, Safe could document an incident of police brutality and bring key evidence to light in a court house. This would give the judge and the jury a complete view of what, where, and when the situation happened.
  ''';

// General Colors
const kPrimaryColor = Color(0xff3b3a3a);
const kAccentColor = Color(0xff2bfec1);

// Background Colors
const kPrimaryBackgroundColor = Color(0xffF8F8F8);
const kSecondaryBackgroundColor = Color(0xffECE8E9);
const kTerciaryBackgroundColor = Colors.white;

// Text

const kRegularTextColor = Color(0xff3B3A3A);
const kActiveTextColor = Color(0xff1bb187);

const kNavigationBarText = TextStyle(
  color: kRegularTextColor,
  fontFamily: "SF_Pro_Semibold",
  fontSize: 16,
  decoration: TextDecoration.none,
  fontWeight: FontWeight.normal,
);

const kHeader1 = TextStyle(
  color: kRegularTextColor,
  fontFamily: "SF_Pro_Bold",
  fontSize: 70,
);

const kButtonTextStyle = TextStyle(
  color: kPrimaryColor,
  fontFamily: "SF_Pro_Bold",
);
