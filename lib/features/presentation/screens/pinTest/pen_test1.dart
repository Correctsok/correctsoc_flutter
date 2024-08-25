import 'package:correctsoc/core/components/sub_title.dart';
import 'package:correctsoc/core/utils/app_colors.dart';
import 'package:correctsoc/core/utils/assets_manager.dart';
import 'package:correctsoc/features/presentation/screens/pinTest/pen_test2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/components.dart';
import '../home/home_page.dart';


class PenTest1 extends StatefulWidget {
  const PenTest1({super.key});

  @override
  State<PenTest1> createState() => _PenTest1State();
}

class _PenTest1State extends State<PenTest1>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // Adjust the duration as needed
    )..repeat(); // Repeats the animation indefinitely

    // You can also add other animations or logic here
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
                  SizedBox(width: 100.w,),
                  SubTitle(text: 'Self Pen Test', size: 22, color: whiteColor, weight: FontWeight.w500),
                ],
              )),
               Positioned(
                top: 130,
                right: 0,
                left: 0,
                child: Column(
                  children: [
                    SubTitle(text: 'Self Penetration Test', size: 22, color: whiteColor, weight: FontWeight.w500),
                    SizedBox(height: 20.h,),
                    SubTitle(text: 'Please, Enable the Wi-Fi\nconnection on the network\nyou would like to scan', size: 15, color: textTitleColor, weight: FontWeight.w300),
                  ],
                )),
          Positioned(
              child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100, left: 10, right: 10),
                child: RotationTransition(
                  turns: _controller,
                  child: Image.asset(
                    loading,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 385, left: 170, right: 160),
                child:InkWell(
                  onTap: () => navigateTo(context, const PenTest2()),
                  child: SubTitle(text: 'START', size: 20, color: whiteColor, weight: FontWeight.w500)),
              ),
            ],
          )),
         Padding(
           padding: const EdgeInsets.only(top: 560,left: 150,right: 20),
           child: Image.asset(dots2),
         )
        ],
      ),
    );
  }
}
