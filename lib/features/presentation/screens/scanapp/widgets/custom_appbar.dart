
import 'package:correctsoc/config/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/components/components.dart';
import '../../../../../core/components/sub_title.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../home/home_page.dart';

class CustomAppBar3 extends StatelessWidget {
  const CustomAppBar3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
          top: 45,
          left: 0.5,
          right: 2,
          child: Row(
            children: [
    IconButton(
        onPressed: () {
          navigateTo(context, const HomePageView());
        },
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: whiteColor,
          size: 25,
        )),
    SizedBox(
      width: 40.w,
    ),
    SubTitle(
        text: 'Screening Applications'.tr(context),
        size: 24,
        color: whiteColor,
        weight: FontWeight.w600),
            ],
          ),
        );
  }
}


class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 90),
      child: Divider(
        color: whiteColor,
        thickness: 3.0,
      ),
    );
  }
}