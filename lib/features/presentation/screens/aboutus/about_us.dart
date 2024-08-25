
import 'package:correctsoc/core/components/sub_title.dart';
import 'package:correctsoc/core/utils/app_colors.dart';
import 'package:correctsoc/core/utils/assets_manager.dart';
import 'package:correctsoc/features/presentation/screens/aboutus/widgets/custom_appbar.dart';
import 'package:correctsoc/features/presentation/screens/aboutus/widgets/customsocial_media.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_strings.dart';
import '../../tools/backgroundimage1.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundAboutUs(),
          const CustomAppBarAbout(),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                width: 345.w,
                height: 622.h,
                decoration: BoxDecoration(
                    color: primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Image.asset(
                            logo20,
                            width: 220.w,
                          ),
                        )),
                    // SizedBox(
                    //   height: 0.5.h,
                    // ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Flexible(
                                child: SubTitle(
                              text: textTitleAbout,
                              size: 15,
                              color: textTitleColor,
                              weight: FontWeight.w600,
                            ))
                            //  Image.asset(
                            //   textAbout,
                            //   fit: BoxFit.contain,
                            //   width: 250.w,
                            // ),
                            )),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomSocialMedia(
                          picIcon: facebooklogo,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        CustomSocialMedia(
                          picIcon: instagramlogo,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        CustomSocialMedia(
                          picIcon: websitlogo,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
