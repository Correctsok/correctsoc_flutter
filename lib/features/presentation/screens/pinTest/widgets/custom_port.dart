import 'package:correctsoc/config/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/components/sub_title.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets_manager.dart';

class CustomPort extends StatelessWidget {
  const CustomPort({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 351.w,
      height: 58.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [bg5, bg6],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              carbonsecurity,
              width: 25,
            ),
            SizedBox(
              width: 10.w,
            ),
            SubTitle(
                text: 'No open ports'.tr(context),
                size: 22,
                color: whiteColor,
                weight: FontWeight.w500),
          ],
        ),
      ),
    );
  }
}
