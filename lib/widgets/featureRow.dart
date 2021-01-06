import 'package:flutter/material.dart';
import 'package:website/services/screenSizeIndicator.dart';

enum ProductImage {
  brightness,
  profile,
  incident,
  vault,
}

class FeatureRow extends StatefulWidget {
  @override
  _FeatureRowState createState() => _FeatureRowState();
}

class _FeatureRowState extends State<FeatureRow> {
  ProductImage imageSelected = ProductImage.profile;

  String extractImage(ProductImage asset) {
    String pointer = "";
    for (int i = 0; i < asset.toString().length; i++) {
      if (i > 12) {
        pointer += asset.toString()[i];
      }
    }
    return "assets/images/$pointer.webp";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenSizeIndicator.getScreenSize(context, Axis.horizontal) * 0.7,
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    SizedBox(
                      width: 7,
                      height: 570,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  extractImage(
                    imageSelected,
                  ),
                  height: 700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
