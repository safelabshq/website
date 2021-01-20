import 'dart:convert';

import 'package:flutter/material.dart';

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
  bool active;

  List<Map<String, String>> features = [
    {
      "header": "True Documentation",
      "message":
          "Both front and back camera will automatically start recording. Your exact location will also be documented."
    },
    {
      "header": "Notifies Emergency Contacts",
      "message":
          "All of your emergency contacts (that you select) will be notified via SMS. Your emergency contacts have access to everything documented in case anything happens to you."
    },
    {
      "header": "Uploaded to The Cloud",
      "message":
          "If anything is to happen to your phone, don’t worry. Everything recorded is immediately uploaded to the cloud for safe keeping."
    },
    {
      "header": "Lowered Brightness",
      "message":
          "The phone’s brightness will automatically lower so it is harder for an individual to know you’re recording."
    }
  ];

  Future<Map<String, String>> fetchData() async {
    return {
      "header": features[widget.index]["header"],
      "message": features[widget.index]["message"],
    };
  }

  @override
  void initState() {
    super.initState();
  }

  void setStateIfMounted(Function f) {
    if (mounted) {
      setState(f);
    }
  }

  @override
  Widget build(BuildContext context) {
    active = !widget.isActive;
    fetchData().then(
      (e) => {
        setStateIfMounted(() {
          header = e["header"];
          message = e["message"];
        })
      },
    );
    return SizedBox(
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: TextStyle(
              color: active ? Color(0xffb5b5b5) : Color(0xff232323),
              fontSize: 27,
              letterSpacing: -0.5,
              fontFamily: "SF_Pro_Bold",
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
          ),
          SizedBox(height: 10),
          Text(
            message,
            style: TextStyle(
              color: active ? Color(0xffb5b5b5) : Color(0xff232323),
              fontSize: 18,
              fontFamily: "SF_Pro",
            ),
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
