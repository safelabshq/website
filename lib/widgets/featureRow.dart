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
  bool ovr1 = true;
  bool ovr2 = false;
  bool ovr3 = false;
  bool ovr4 = false;

  String extractImage(ProductImage asset) {
    String pointer = "";
    for (int i = 0; i < asset.toString().length; i++) {
      if (i > 12) {
        pointer += asset.toString()[i];
      }
    }
    return "assets/images/$pointer.webp";
  }

  void setStateIfMounted(Function f) {
    if (mounted) {
      setState(f);
    }
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
                      start: HSector.trueDocumentation,
                      end: HSector.lowersBrightness,
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
                              setStateIfMounted(() {
                                ovr1 = true;
                                ovr2 = false;
                                ovr3 = false;
                                ovr4 = false;
                                feat1 = false;
                                feat2 = false;
                                feat3 = false;
                                feat4 = false;
                              });
                            },
                            child: MouseRegion(
                              onEnter: (PointerEvent _) {
                                setStateIfMounted(() {
                                  feat1 = true;
                                });
                              },
                              onExit: (PointerEvent _) {
                                setStateIfMounted(() {
                                  feat1 = false;
                                });
                              },
                              child: TextIndex(
                                width: 350,
                                index: 0,
                                isActive: ovr1 ? ovr1 : feat1,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setStateIfMounted(() {
                                ovr1 = false;
                                ovr2 = true;
                                ovr3 = false;
                                ovr4 = false;
                                feat1 = false;
                                feat2 = false;
                                feat3 = false;
                                feat4 = false;
                              });
                            },
                            child: MouseRegion(
                              onEnter: (PointerEvent _) {
                                setStateIfMounted(() {
                                  feat2 = true;
                                });
                              },
                              onExit: (PointerEvent _) {
                                setStateIfMounted(() {
                                  feat2 = false;
                                });
                              },
                              child: TextIndex(
                                width: 400,
                                index: 1,
                                isActive: ovr2 ? ovr2 : feat2,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setStateIfMounted(() {
                                ovr1 = false;
                                ovr2 = false;
                                ovr3 = true;
                                ovr4 = false;
                                feat1 = false;
                                feat2 = false;
                                feat3 = false;
                                feat4 = false;
                              });
                            },
                            child: MouseRegion(
                              onEnter: (PointerEvent _) {
                                setStateIfMounted(() {
                                  feat3 = true;
                                });
                              },
                              onExit: (PointerEvent _) {
                                setStateIfMounted(() {
                                  feat3 = false;
                                });
                              },
                              child: TextIndex(
                                width: 350,
                                index: 2,
                                isActive: ovr3 ? ovr3 : feat3,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setStateIfMounted(() {
                                ovr1 = false;
                                ovr2 = false;
                                ovr3 = false;
                                ovr4 = true;
                                feat1 = false;
                                feat2 = false;
                                feat3 = false;
                                feat4 = false;
                              });
                            },
                            child: MouseRegion(
                              onEnter: (PointerEvent _) {
                                setStateIfMounted(() {
                                  feat4 = true;
                                });
                              },
                              onExit: (PointerEvent _) {
                                setStateIfMounted(() {
                                  feat4 = false;
                                });
                              },
                              child: TextIndex(
                                width: 350,
                                index: 3,
                                isActive: ovr4 ? ovr4 : feat4,
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
