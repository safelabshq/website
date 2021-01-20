import 'package:flutter/material.dart';
import 'package:website/services/screenSizeIndicator.dart';
import 'package:website/widgets/barHighlight.dart';
import 'package:website/widgets/textIndex.dart';

enum HSector {
  trueDocumentation,
  notifyContacts,
  uploadsCloud,
  lowersBrightness,
}

enum ProductImage {
  homeScreen,
  profileScreen,
  incidentScreen,
  vaultScreen,
}

Map<HSector, double> margins = {
  HSector.trueDocumentation: 0,
  HSector.notifyContacts: 145,
  HSector.uploadsCloud: 305,
  HSector.lowersBrightness: 470,
};

Map<HSector, double> heights = {
  HSector.trueDocumentation: 105,
  HSector.notifyContacts: 120,
  HSector.uploadsCloud: 125,
  HSector.lowersBrightness: 100,
};

class FeatureRow extends StatefulWidget {
  @override
  _FeatureRowState createState() => _FeatureRowState();
}

class _FeatureRowState extends State<FeatureRow> with TickerProviderStateMixin {
  AnimationController motionController;
  AnimationController heightController;

  double margin;
  double upperBound = 700;
  bool isReverse;
  bool isHeightReverse;
  double startHeight;
  double endHeight;
  double lowerBound = 0;
  ProductImage imageSelected = ProductImage.homeScreen;

  bool feat1 = true;
  bool feat2 = false;
  bool feat3 = false;
  bool feat4 = false;
  bool ovr1 = true;
  bool ovr2 = false;
  bool ovr3 = false;
  bool ovr4 = false;

  HSector onPointer = HSector.trueDocumentation;
  HSector toPointer = HSector.notifyContacts;

  void initializeHeightValues(HSector start, HSector end) {
    switch (start) {
      case HSector.trueDocumentation:
        isHeightReverse = false;
        startHeight = heights[HSector.trueDocumentation];
        switch (end) {
          case HSector.trueDocumentation:
            endHeight = heights[HSector.trueDocumentation];
            break;
          case HSector.lowersBrightness:
            endHeight = heights[HSector.lowersBrightness];
            isHeightReverse = true;
            break;
          case HSector.notifyContacts:
            endHeight = heights[HSector.notifyContacts];
            break;
          case HSector.uploadsCloud:
            endHeight = heights[HSector.uploadsCloud];
            break;
        }
        break;
      case HSector.lowersBrightness:
        isHeightReverse = false;
        startHeight = heights[HSector.lowersBrightness];
        switch (end) {
          case HSector.trueDocumentation:
            isHeightReverse = true;
            endHeight = heights[HSector.trueDocumentation];
            break;
          case HSector.lowersBrightness:
            endHeight = heights[HSector.lowersBrightness];
            break;
          case HSector.notifyContacts:
            endHeight = heights[HSector.notifyContacts];
            break;
          case HSector.uploadsCloud:
            endHeight = heights[HSector.uploadsCloud];
            break;
        }
        break;
      case HSector.notifyContacts:
        isHeightReverse = false;
        startHeight = heights[HSector.notifyContacts];
        switch (end) {
          case HSector.trueDocumentation:
            isHeightReverse = true;
            endHeight = heights[HSector.trueDocumentation];
            break;
          case HSector.lowersBrightness:
            isHeightReverse = true;
            endHeight = heights[HSector.lowersBrightness];
            break;
          case HSector.notifyContacts:
            endHeight = heights[HSector.notifyContacts];
            break;
          case HSector.uploadsCloud:
            endHeight = heights[HSector.uploadsCloud];
            break;
        }
        break;
      case HSector.uploadsCloud:
        isHeightReverse = true;
        startHeight = heights[HSector.uploadsCloud];
        switch (end) {
          case HSector.trueDocumentation:
            endHeight = heights[HSector.trueDocumentation];
            break;
          case HSector.lowersBrightness:
            endHeight = heights[HSector.lowersBrightness];
            break;
          case HSector.notifyContacts:
            endHeight = heights[HSector.notifyContacts];
            break;
          case HSector.uploadsCloud:
            isHeightReverse = false;
            endHeight = heights[HSector.uploadsCloud];
            break;
        }
        break;
    }
  }

  void initializeMotionValues(HSector start, HSector end) {
    switch (start) {
      case HSector.trueDocumentation:
        print(1);
        isReverse = false;

        margin = margins[HSector.trueDocumentation];
        switch (end) {
          case HSector.trueDocumentation:
            upperBound = margins[HSector.trueDocumentation];
            break;
          case HSector.notifyContacts:
            upperBound = margins[HSector.notifyContacts];
            break;
          case HSector.uploadsCloud:
            upperBound = margins[HSector.uploadsCloud];
            break;
          case HSector.lowersBrightness:
            upperBound = margins[HSector.lowersBrightness];
            break;
        }
        break;
      case HSector.notifyContacts:
        print(2);
        isReverse = false;
        margin = margins[HSector.notifyContacts];
        switch (end) {
          case HSector.trueDocumentation:
            lowerBound = margins[HSector.trueDocumentation];
            isReverse = true;
            break;
          case HSector.notifyContacts:
            upperBound = margins[HSector.notifyContacts];
            break;
          case HSector.uploadsCloud:
            upperBound = margins[HSector.uploadsCloud];
            break;
          case HSector.lowersBrightness:
            upperBound = margins[HSector.lowersBrightness];
            break;
        }
        break;
      case HSector.uploadsCloud:
        print(3);
        isReverse = false;
        margin = margins[HSector.uploadsCloud];
        switch (end) {
          case HSector.trueDocumentation:
            lowerBound = margins[HSector.trueDocumentation];
            isReverse = true;
            break;
          case HSector.notifyContacts:
            isReverse = true;
            lowerBound = margins[HSector.notifyContacts];
            break;
          case HSector.uploadsCloud:
            upperBound = margins[HSector.uploadsCloud];
            break;
          case HSector.lowersBrightness:
            upperBound = margins[HSector.lowersBrightness];
            break;
        }
        break;
      case HSector.lowersBrightness:
        print(4);
        isReverse = true;
        margin = margins[HSector.lowersBrightness];
        switch (end) {
          case HSector.trueDocumentation:
            lowerBound = margins[HSector.trueDocumentation];
            break;
          case HSector.notifyContacts:
            lowerBound = margins[HSector.notifyContacts];
            break;
          case HSector.uploadsCloud:
            lowerBound = margins[HSector.uploadsCloud];
            break;
          case HSector.lowersBrightness:
            isReverse = false;
            upperBound = margins[HSector.lowersBrightness];
            break;
        }
        break;
    }
  }

  void initAnimation() {
    initializeMotionValues(onPointer, toPointer);
    initializeHeightValues(onPointer, toPointer);

    motionController = AnimationController(
      vsync: this,
      value: margin,
      lowerBound: lowerBound,
      upperBound: upperBound,
      duration: Duration(milliseconds: 250),
    );
    heightController = AnimationController(
      vsync: this,
      lowerBound: isHeightReverse ? endHeight : startHeight,
      value: startHeight,
      upperBound: isHeightReverse ? 700 : endHeight,
      duration: Duration(milliseconds: 250),
    );

    heightController.addListener(
      () {
        setState(() {});
      },
    );

    motionController.addListener(
      () {
        setState(() {});
      },
    );

    isReverse ? motionController.reverse() : motionController.forward();
    isHeightReverse ? heightController.reverse() : heightController.forward();

    setStateIfMounted(() {
      onPointer = toPointer;
    });
  }

  @override
  void initState() {
    // Initialize Values
    initializeMotionValues(HSector.trueDocumentation, HSector.notifyContacts);
    initializeHeightValues(HSector.trueDocumentation, HSector.notifyContacts);

    // Animation
    motionController = AnimationController(
      vsync: this,
      value: margin,
      lowerBound: lowerBound,
      upperBound: upperBound,
      duration: Duration(milliseconds: 250),
    );
    heightController = AnimationController(
      vsync: this,
      lowerBound: isHeightReverse ? endHeight : startHeight,
      value: startHeight,
      upperBound: isHeightReverse ? 700 : endHeight,
      duration: Duration(milliseconds: 250),
    );

    heightController.addListener(
      () {
        setState(() {});
      },
    );

    motionController.addListener(
      () {
        setState(() {});
      },
    );

    super.initState();
  }

  double getHeight() {
    if (startHeight < endHeight) {
      return startHeight > heightController.value
          ? startHeight
          : heightController.value;
    } else {
      return startHeight < heightController.value
          ? startHeight
          : heightController.value;
    }
  }

  @override
  void dispose() {
    motionController.dispose();
    heightController.dispose();
    super.dispose();
  }

  void setStateIfMounted(Function f) {
    if (mounted) {
      setState(f);
    }
  }

  String extractImage(ProductImage asset) {
    String pointer = "";
    for (int i = 0; i < asset.toString().length; i++) {
      if (i > 12) {
        pointer += asset.toString()[i];
      }
    }
    return "assets/images/$pointer.png";
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
                child: Stack(
                  children: [
                    Container(
                      height: 570,
                      child: Row(
                        children: [
                          Stack(
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
                                    ),
                                    BarHighlight(
                                      height: heightController.value,
                                      margin: motionController.value,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 30),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                        imageSelected = ProductImage.homeScreen;

                                        toPointer = HSector.trueDocumentation;
                                        initAnimation();
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
                                        imageSelected =
                                            ProductImage.profileScreen;

                                        toPointer = HSector.notifyContacts;
                                        initAnimation();
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
                                        imageSelected =
                                            ProductImage.incidentScreen;

                                        toPointer = HSector.uploadsCloud;
                                        initAnimation();
                                      });
                                    },
                                    child: MouseRegion(
                                      onEnter: (PointerEvent _) {
                                        setStateIfMounted(() {
                                          feat3 = true;
                                        });
                                      },
                                      onExit: (PointerEvent _) {
                                        setState(() {
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
                                        imageSelected =
                                            ProductImage.vaultScreen;

                                        toPointer = HSector.lowersBrightness;
                                        initAnimation();
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
                  extractImage(imageSelected),
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
