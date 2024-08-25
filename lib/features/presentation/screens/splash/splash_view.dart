import 'package:correctsoc/core/components/sub_title.dart';
import 'package:correctsoc/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/components.dart';
import '../../../../core/utils/assets_manager.dart';

import '../onbaording/on_boardin_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      // Navigator.of(context).pushReplacementNamed(Routes.onbording); PaymentDetails
      // navigateAndFinish(context, const PaymentDetails());
        navigateAndFinish(context, const OnBoardingBody());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
        width: double.maxFinite.w,
        height: double.maxFinite.h,
        child: Image.asset(
          splash,
          fit: BoxFit.cover,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 600,left: 0,right: 0),
        child: Center(child: SubTitle(text: 'Version: 1.1', size: 18, color: textTitleColor, weight: FontWeight.bold)),
      ),
        ],
      )
    );
  }
}
