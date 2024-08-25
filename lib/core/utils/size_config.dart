

import 'package:flutter/material.dart';

class SizeConfig {
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BoxConstraints constraints, Orientation orientation) {
    screenWidth = constraints.maxWidth;
    screenHeight = constraints.maxHeight;
    defaultSize = orientation == Orientation.portrait
        ? screenWidth! * 0.024
        : screenHeight! * 0.024;
    SizeConfig.orientation = orientation;
  }
}