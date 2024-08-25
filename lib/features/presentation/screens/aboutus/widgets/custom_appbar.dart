
import 'package:flutter/material.dart';

import '../../../../../core/components/components.dart';
import '../../../../../core/components/sub_title.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../home/home_page.dart';



class CustomAppBarAbout extends StatelessWidget {
  const CustomAppBarAbout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
          top: 45,
          left: 0.5,
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
    // SizedBox(
    //   width: 70.w,
    // ),
    SubTitle(
        text: 'About Us',
        size: 24,
        color: whiteColor,
        weight: FontWeight.w600),
            ],
          ),
        );
  }
}


class CustomDividerAbout extends StatelessWidget {
  const CustomDividerAbout({
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