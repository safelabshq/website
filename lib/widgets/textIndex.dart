import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class TextIndex extends StatefulWidget {
  final bool isActive;
  final int index;
  final double width;

  TextIndex({
    @required this.isActive,
    @required this.index,
    @required this.width,
  });

  @override
  _TextIndexState createState() => _TextIndexState();
}

class _TextIndexState extends State<TextIndex> {
  String header = "fetching";
  String message = "fetching";

  void fetchData() async {
    String json = await rootBundle.loadString("json/features.json");

    setState(() {
      header = jsonDecode(json)["data"][widget.index]["header"];
      message = jsonDecode(json)["data"][widget.index]["message"];
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    fetchData();
    return SizedBox(
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: TextStyle(
              color: widget.isActive ? Color(0xffb5b5b5) : Color(0xff232323),
              fontSize: 27,
              letterSpacing: -0.5,
              fontFamily: "SF_Pro_Bold",
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            message,
            style: TextStyle(
              color: widget.isActive ? Color(0xffb5b5b5) : Color(0xff232323),
              fontSize: 18,
              fontFamily: "SF_Pro",
            ),
          ),
        ],
      ),
    );
  }
}
