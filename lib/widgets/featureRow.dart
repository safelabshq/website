import 'package:flutter/material.dart';
import 'package:website/services/screenSizeIndicator.dart';
import 'package:website/widgets/featureNavBar.dart';
import 'package:website/widgets/textIndex.dart';

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
  bool feat1 = true;
  bool feat2 = false;
  bool feat3 = false;
  bool feat4 = false;

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
                    FeatureNavBar(
                      start: HSector.lowersBrightness,
                      end: HSector.trueDocumentation,
                    ),
                    SizedBox(width: 30),
                    SizedBox(
                      height: 570,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                feat1 = true;
                                feat2 = false;
                                feat3 = false;
                                feat4 = false;
                              });
                            },
                            child: MouseRegion(
                              child: TextIndex(
                                width: 350,
                                index: 0,
                                isActive: feat1,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                feat1 = false;
                                feat2 = true;
                                feat3 = false;
                                feat4 = false;
                              });
                            },
                            child: MouseRegion(
                              child: TextIndex(
                                width: 400,
                                index: 1,
                                isActive: feat2,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                feat1 = false;
                                feat2 = false;
                                feat3 = true;
                                feat4 = false;
                              });
                            },
                            child: MouseRegion(
                              child: TextIndex(
                                width: 350,
                                index: 2,
                                isActive: feat3,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                feat1 = false;
                                feat2 = false;
                                feat3 = false;
                                feat4 = true;
                              });
                            },
                            child: MouseRegion(
                              child: TextIndex(
                                width: 350,
                                index: 3,
                                isActive: feat4,
                              ),
                            ),
                          ),
                        ],
                      ),
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
