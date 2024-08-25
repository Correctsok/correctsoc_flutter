
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class CustomIndicator extends StatelessWidget {
    final double? dotIndex;
    const CustomIndicator({super.key, required this.dotIndex});
  @override
  Widget build(BuildContext context) {
    return Center(child: Padding(
      padding:  const EdgeInsets.only(top: 450),
      child: DotsIndicator(
        dotsCount: 4,
        position: dotIndex!,
        decorator:  DotsDecorator(
          size:  const Size.square(18.0),
          activeSize: const Size.square(18.0),
          color: Colors.transparent,
          activeColor: whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(
              color: dotsColor,
            ),
          )
        ),
        ),
    ));
  }
}
