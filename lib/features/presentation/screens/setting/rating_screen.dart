import 'package:correctsoc/core/components/components.dart';
import 'package:correctsoc/core/components/sub_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../home/home_page.dart';

class RatingScreen extends StatelessWidget {
  const RatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.maxFinite.w,
            height: double.maxFinite.h,
            child: Image.asset(
              backgroundimage2,
              fit: BoxFit.cover,
            ),
          ),
        
          Positioned(
              top: 42,
              child: Image.asset(
                warning,
                width: 400.w,
              )),
          Positioned(
            top: 540,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    warning,
                    width: 400.w,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 45),
            child: Container(
              width: double.maxFinite,
              height: 700,
              decoration: BoxDecoration(
                color: Colors.black45.withOpacity(0.6),
                //  borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Container(
                  width: double.maxFinite,
                  height: 600,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 170.h,
                      ),
                      Image.asset(
                        logo,
                        width: 300.w,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SubTitle(
                          text: 'Your opinion matters to us!',
                          size: 20,
                          color: whiteColor,
                          weight: FontWeight.w700),
                      SizedBox(
                        height: 5.h,
                      ),
                      SubTitle(
                          text:
                              'We work super harrd to serve you better and woruld',
                          size: 14,
                          color: textTitleColor,
                          weight: FontWeight.w400),
                      SubTitle(
                          text:
                              'nWe work super harrd to serve you better and woruld love to know how would you rate our app?',
                          size: 7,
                          color: textTitleColor,
                          weight: FontWeight.w400),
                      SizedBox(
                        height: 30.h,
                      ),
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          // print(rating);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 60,
            child: Container(
              width: 278.w,
              height: 53.h,
              decoration: BoxDecoration(
                color: backgroundButton,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(child: SubTitle(text: 'SUBMIT', size: 20, color: whiteColor, weight: FontWeight.bold)),
            ),
          ),
            Positioned(
            top: 40,
            child: IconButton(
                    onPressed: ()=>navigateTo(context, const HomePageView()),
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: whiteColor,
                    )),
          ),

        ],
      ),
    );
  }
}
