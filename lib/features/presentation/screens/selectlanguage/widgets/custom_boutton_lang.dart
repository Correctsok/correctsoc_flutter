
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/components/sub_title.dart';
import '../../../../../core/utils/app_colors.dart';

class CustomBouttonLang extends StatelessWidget {
    String text;
  final VoidCallback? onTap;
   CustomBouttonLang({
    super.key,
    required this.text,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: 284.w,
            height: 50.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [bg7, bg6],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: Center(
              child: SubTitle(
                  text: text,
                  size: 20,
                  color: textTitleColor,
                  weight: FontWeight.w700),
            ),
          ),
        )
      ],
    );
  }
}

//custom_boutton_lang.dart