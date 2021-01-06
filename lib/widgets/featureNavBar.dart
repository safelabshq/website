import 'package:flutter/material.dart';
import 'package:website/utils/constants.dart';

enum HSector {
  trueDocumentation,
  notifyContacts,
  uploadsCloud,
  lowersBrightness,
}

class FeatureNavBar extends StatefulWidget {
  final HSector start;
  final HSector end;

  FeatureNavBar({@required this.start, @required this.end});

  @override
  _FeatureNavBarState createState() => _FeatureNavBarState();
}

class _FeatureNavBarState extends State<FeatureNavBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 7,
      height: 570,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget selectHighlight(HSector sector) {
//   switch (sector) {
//     case HSector.trueDocumentation:
//       return BarHighlight(height: 100);
//       break;
//     case HSector.notifyContacts:
//       return BarHighlight(height: 100, margin: 100);
//       break;
//     case HSector.uploadsCloud:
//       return BarHighlight(height: 100, margin: 300);
//       break;
//     case HSector.lowersBrightness:
//       return BarHighlight(height: 100, margin: 500);
//       break;
//     default:
//       return Container();
//       break;
//   }
// }
