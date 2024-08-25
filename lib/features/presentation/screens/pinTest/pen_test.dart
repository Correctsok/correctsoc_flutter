import 'package:correctsoc/config/app_localizations.dart';
import 'package:correctsoc/core/components/components.dart';
import 'package:correctsoc/core/components/sub_title.dart';
import 'package:correctsoc/core/utils/app_colors.dart';
import 'package:correctsoc/core/utils/assets_manager.dart';
import 'package:correctsoc/features/presentation/screens/home/home_page.dart';
import 'package:correctsoc/features/presentation/screens/pinTest/pen_test2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class PenTest extends StatefulWidget {
  const PenTest({super.key});

  @override
  State<PenTest> createState() => _PenTestState();
}

class _PenTestState extends State<PenTest>
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
      body: SafeArea(
        child: Stack(
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
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    Align(
                      alignment: Alignment.center,
                      child: SubTitle(text: 'Check router IP'.tr(context), size: 22, color: whiteColor, weight: FontWeight.w500)),
                  ],
                )),
                 Positioned(
                  top: 130,
                  right: 0,
                  left: 0,
                  child: Column(
                    children: [
                      // SubTitle(text: 'Self Penetration Test', size: 22, color: whiteColor, weight: FontWeight.w500),
                      SizedBox(height: 20.h,),
                      SubTitle(text: 'Test your network for\nexternal open ports'.tr(context), size: 20, color: whiteColor, weight: FontWeight.w300),
                    ],
                  )),
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
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                     padding:  const EdgeInsets.only(top: 100),
                    child: GestureDetector(
                       onTap: () => navigateTo(context, const PenTest2()),
                      child: SubTitle(text: 'START'.tr(context), size: 18, color: whiteColor, weight: FontWeight.w900)),
                  )),
              ],
            )),
           Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(right: 82),
              child: Image.asset(dots1),
            ))
          ],
        ),
      ),
    );
  }
}

//  padding:  EdgeInsets.only(top: 400.dg, left: 165.dg, right: 160),   padding:  EdgeInsets.only(top: 560.dg,left: 90.dg,right: 0),