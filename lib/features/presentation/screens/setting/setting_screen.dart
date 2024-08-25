import 'package:correctsoc/core/components/components.dart';
import 'package:correctsoc/core/components/sub_title.dart';
import 'package:correctsoc/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/assets_manager.dart';
import '../home/home_page.dart';
import '../selectlanguage/select_language.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

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
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              width: double.maxFinite.w,
              height: 60.h,
              color: Colors.transparent,
              child: Row(
                children: [
                  IconButton(
                      onPressed: ()=>navigateTo(context, const HomePageView()),
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: whiteColor,
                      )),
                  SubTitle(
                      text: 'Setting',
                      size: 22,
                      color: whiteColor,
                      weight: FontWeight.w600),
                  const Spacer(),
                  //  IconButton(
                  //   onPressed: (){
                  //    navigateTo(context, const RatingScreen());
                  //  },
                  //   icon: const Icon(
                  //   Icons.star,
                  //   color: Colors.amberAccent,
                  // ),)
                  const SizedBox(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100, right: 0, left: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SubTitle(
                    text: 'Mobile Anti Spy',
                    size: 22,
                    color: whiteColor,
                    weight: FontWeight.w500),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  width: 275.w,
                  height: 52.h,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                      child: SubTitle(
                          text: 'Upgrade to premium',
                          size: 18,
                          color: subTitlecolore,
                          weight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    // padding: const EdgeInsets.all(8.0),
                    width: double.maxFinite,
                    height: 276.h,
                    decoration: BoxDecoration(
                      color: whiteColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: SubTitle(
                                  text: 'General',
                                  size: 18,
                                  color: whiteColor,
                                  weight: FontWeight.bold)),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Image.asset(
                                    notification,
                                    width: 30.w,
                                  )),
                              SizedBox(
                                width: 5.w,
                              ),
                              SubTitle(
                                  text: 'Notification setting',
                                  size: 16,
                                  color: whiteColor,
                                  weight: FontWeight.w400)
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          InkWell(
                            onTap: (){
                              navigateTo(context,  SelectLanguage());
                            },
                            child: Row(
                              children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Image.asset(
                                      language,
                                      width: 30.w,
                                    )),
                                SizedBox(
                                  width: 5.w,
                                ),
                                SubTitle(
                                    text: 'Language setting',
                                    size: 16,
                                    color: whiteColor,
                                    weight: FontWeight.w400)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Image.asset(
                                    shareoutline,
                                    width: 30.w,
                                  )),
                              SizedBox(
                                width: 5.w,
                              ),
                              SubTitle(
                                  text: 'Share with friends',
                                  size: 16,
                                  color: whiteColor,
                                  weight: FontWeight.w400)
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Image.asset(
                                    feedbackoutline,
                                    width: 30.w,
                                  )),
                              SizedBox(
                                width: 5.w,
                              ),
                              SubTitle(
                                  text: 'Send Feedback',
                                  size: 16,
                                  color: whiteColor,
                                  weight: FontWeight.w400)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    // padding: const EdgeInsets.all(8.0),
                    width: double.maxFinite,
                    height: 129.h,
                    decoration: BoxDecoration(
                      color: whiteColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: SubTitle(
                                  text: 'Security',
                                  size: 18,
                                  color: whiteColor,
                                  weight: FontWeight.bold)),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Image.asset(
                                    privacy,
                                    width: 30.w,
                                  )),
                              SizedBox(
                                width: 5.w,
                              ),
                              SubTitle(
                                  text: 'Privacy Policy',
                                  size: 16,
                                  color: whiteColor,
                                  weight: FontWeight.w400)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
