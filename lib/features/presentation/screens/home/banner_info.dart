import 'package:correctsoc/core/components/components.dart';
import 'package:correctsoc/core/components/sub_title.dart';
import 'package:correctsoc/features/presentation/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class BannerInfo extends StatelessWidget {
  const BannerInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: double.maxFinite.w,
        height: double.maxFinite.h,
        decoration: const BoxDecoration(
          gradient:  LinearGradient(
            colors: [bg6, bg5],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 40.h,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  IconButton(onPressed: (){
                    navigateTo(context, HomePageView());
                  }, icon: const Icon(Icons.arrow_back_ios,color: whiteColor,size: 30,))
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              width: 345.w,
              height: 622.h,
              decoration: BoxDecoration(
                color: bg12,
                borderRadius: BorderRadius.circular(20),
                ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset('assets/images/rectangle2.png'),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SubTitle(text: '20% OFF', size: 22, color: whiteColor, weight: FontWeight.bold),
                  SizedBox(
                    height: 10.h,
                  ),
                  SubTitle(text: '30 days to apply and earn a', size: 18, color: v5Color, weight: FontWeight.w500),
                  SubTitle(text: 'scholarship to study online for an', size: 18, color: v5Color, weight: FontWeight.w500),
                  SubTitle(text: 'MBA degree through Unicaf', size: 18, color: v5Color, weight: FontWeight.w500),
                  SubTitle(text: 'Sponsored Unicaf 30 days to apply', size: 18, color: v5Color, weight: FontWeight.w500),
                  SubTitle(text: 'and earn a scholarship to study online', size: 18, color: v5Color, weight: FontWeight.w500),
                  SubTitle(text: 'for an MBA degree through Unica', size: 18, color: v5Color, weight: FontWeight.w500),
                  SubTitle(text: 'Sponsored Unicaf ', size: 18, color: v5Color, weight: FontWeight.w500),

                ],
              ),
              ),

          ],
        ),
      ),
    );
  }
}
