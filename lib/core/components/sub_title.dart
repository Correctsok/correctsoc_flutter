// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

import '../utils/app_strings.dart';

class SubTitle extends StatelessWidget {
  String text;
  double size;
  Color color;
  FontWeight weight;
  TextAlign align;

  SubTitle(
      {super.key,
      required this.text,
      required this.size,
      required this.color,
      required this.weight,
      this.align = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // textAlign: align,
      style: TextStyle(
        color: color,
        fontFamily: AppStrings.fontFamily,
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}


class SubTitle2 extends StatelessWidget {
  String text;
  double size;
  Color color;
  FontWeight weight;
  TextAlign align;

  SubTitle2(
      {super.key,
      required this.text,
      required this.size,
      required this.color,
      required this.weight,
      this.align = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // textAlign: align,
      style: TextStyle(
        color: color,
        fontFamily: AppStrings.fontFamily,
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}
