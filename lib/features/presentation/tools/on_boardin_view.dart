
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class OnBoardingView  extends StatelessWidget {
  final String image;
  const OnBoardingView ({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      height: double.infinity.h,
      child: Image.asset(
       image,
        fit: BoxFit.cover,
      ),
    );
  }
}