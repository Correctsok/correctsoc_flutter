
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/components/sub_title.dart';
import '../../../../../core/utils/app_colors.dart';

class DrawerWidget extends StatelessWidget {
  String text;
  String icon;
  final VoidCallback? onTap;
  DrawerWidget({
    required this.text,
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(
            icon,
            width: 25,
          ),
          SizedBox(
            width: 17.w,
          ),
          SubTitle(
              text: text, size: 18, color: whiteColor, weight: FontWeight.bold),
        ],
      ),
    );
  }
}