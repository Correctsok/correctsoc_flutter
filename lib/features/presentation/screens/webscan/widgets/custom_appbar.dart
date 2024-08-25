
import 'package:flutter/material.dart';
import '../../../../../core/components/components.dart';
import '../../../../../core/components/sub_title.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../home/home_page.dart';



class CustomAppBar4 extends StatelessWidget {
  const CustomAppBar4({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.5,left: 5.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            //   width: 50.w,
            // ),
            SubTitle(
                text: 'ًًWeb Scan',
                size: 15,
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