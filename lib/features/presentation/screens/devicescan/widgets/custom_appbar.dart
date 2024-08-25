
import 'package:correctsoc/config/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/components.dart';
import '../../../../../core/components/sub_title.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../home/home_page.dart';



class CustomAppBar2 extends StatelessWidget {
  const CustomAppBar2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35,right: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
        navigateTo(context, const  HomePageView());
                },
                icon: const Icon(
        Icons.arrow_back_ios_new,
        color: whiteColor,
        size: 25,
                )),
            // SizedBox(
            //   width: 10.w,
            // ),
            const Spacer(),
           
            SubTitle(
                text: 'Network Scanning'.tr(context),
                size: 24,
                color: whiteColor,
                weight: FontWeight.w600),
          ],
        ),
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