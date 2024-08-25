
import 'package:correctsoc/config/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/sub_title.dart';
import '../../../../core/utils/app_colors.dart';

class OpenPortWidget extends StatelessWidget {
  const OpenPortWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 105,
      left: 5,
      right: 5,
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Container(
          width: 351.w,
          height: 105.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [bg1, bg2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: SubTitle(text: '0 open ports'.tr(context), size: 25, color: mb, weight: FontWeight.w600)),
                SizedBox(height: 8.w,),
                  Align(
                alignment: Alignment.center,
                child: SubTitle(text: 'Known vulnerabilities'.tr(context), size: 20, color: mb, weight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}
