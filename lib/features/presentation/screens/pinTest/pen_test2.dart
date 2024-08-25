import 'dart:async';

import 'package:correctsoc/config/app_localizations.dart';
import 'package:correctsoc/core/components/sub_title.dart';
import 'package:correctsoc/core/utils/app_colors.dart';
import 'package:correctsoc/core/utils/assets_manager.dart';
import 'package:correctsoc/features/presentation/screens/home/home_page.dart';
import 'package:correctsoc/features/presentation/screens/pinTest/pen_test4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../core/components/components.dart';


class PenTest2 extends StatefulWidget {
  const PenTest2({super.key});

  @override
  State<PenTest2> createState() => _PenTest2State();
}

class _PenTest2State extends State<PenTest2>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _percent = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // Adjust the duration as needed
    )..repeat(); // Repeats the animation indefinitely

    // You can also add other animations or logic here
    //  Future.delayed(const Duration(seconds: 6), () {
    //   // Navigator.of(context).pushReplacementNamed(Routes.onbording);
    //   navigateAndFinish(context, const PenTestResults());
    // });
    Timer.periodic(const Duration(microseconds: 300000), (Timer timer) {
      setState(() {
        _percent = (_percent + 0.01).clamp(0.0, 1.0);
        if (_percent >= 1) {
          timer.cancel();
          navigateAndFinish(context, const PenTest4());
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
              backgroundimage,
              fit: BoxFit.cover,
            ),
          ),
           Positioned(
             top: 40,
              child: Row(
                children: [
                  IconButton(onPressed: (){
                    navigateAndFinish(context, const HomePageView());
                  }, icon: const Icon(Icons.arrow_back_ios_new,color: whiteColor,)),
                  const SizedBox(),
                  // InkWell(
                  //   onTap: ()=> navigateTo(context, const Setting()),
                  //   child: Image.asset(
                  //     setting,
                  //     width: 25,
                  //   ),
                  // ),
                  // SizedBox(width: 100.w,),
                  SubTitle(text: 'Check the router IP', size: 22, color: whiteColor, weight: FontWeight.w500),
                ],
              )),
              //  Positioned(
              //   top: 130,
              //   right: 0,
              //   left: 0,
              //   child: Column(
              //     children: [
              //       SubTitle(text: 'Self Penetration Test', size: 22, color: whiteColor, weight: FontWeight.w500),
              //       SizedBox(height: 20.h,),
              //       SubTitle(text: 'Please, Enable the Wi-Fi\nconnection on the network\nyou would like to scan', size: 15, color: textTitleColor, weight: FontWeight.w300),
              //     ],
              //   )),
          Positioned(
              child: Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100, left: 10, right: 10),
                  child: RotationTransition(
                    turns: _controller,
                    child: Image.asset(
                      loading2,
                      width: 400,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 110),
                  child: CircularPercentIndicator(
                    backgroundColor: Colors.transparent,
                    radius: 60.0,
                    lineWidth: 5.0,
                    percent: _percent,
                    center: SubTitle(
                      text: '${(_percent * 100).toStringAsFixed(0)}%',
                       size: 18,
                        color: textTitleColor,
                         weight: FontWeight.w600
                         ),
                    //  Text('${(_percent * 100).toStringAsFixed(0)}%'),
                    progressColor: Colors.transparent,
                  ),
                ),
              ),
            ],
          )),
           Positioned(
                bottom: 80,
                right: 0,
                left: 0,
                child: Column(
                  children: [
                    SubTitle(text: 'Detecting, IP'.tr(context), size: 25, color: whiteColor, weight: FontWeight.w500),
                    SizedBox(height: 20.h,),
                    SubTitle(text: 'Please wait..'.tr(context), size: 15, color: textTitleColor, weight: FontWeight.w300),
                  ],
                )),
        //  Padding(
        //    padding: const EdgeInsets.only(top: 560,left: 150,right: 20),
        //    child: Image.asset(dots2),
        //  )
        ],
      ),
    );
  }
}

// padding:  EdgeInsets.only(top: 360.dg, left: 160.dg, right: 160),