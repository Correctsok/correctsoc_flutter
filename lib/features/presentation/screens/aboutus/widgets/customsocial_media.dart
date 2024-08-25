
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';

class CustomSocialMedia extends StatelessWidget {
  String picIcon;
  CustomSocialMedia({
    super.key,
    required this.picIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.w,
      height: 48.h,
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(20)),
          child:  Image(image: AssetImage(picIcon)),
    );
  }
}


