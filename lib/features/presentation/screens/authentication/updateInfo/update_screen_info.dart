import 'package:correctsoc/core/components/components.dart';
import 'package:correctsoc/core/components/sub_title.dart';
import 'package:correctsoc/core/utils/app_colors.dart';
import 'package:correctsoc/features/presentation/screens/setting/setting2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/components/custom_bouttn.dart';

class UpdateInfo extends StatelessWidget {
  const UpdateInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bc3.png'), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      navigateAndFinish(context, const Setting2());
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: whiteColor,
                      size: 30,
                    )),
                SubTitle(
                  text: 'Edit Information',
                  size: 22,
                  color: whiteColor,
                  weight: FontWeight.w800,
                )
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.only(right: 210.dm),
              child: SubTitle(
                text: 'First Name',
                size: 22,
                color: whiteColor,
                weight: FontWeight.w800,
              ),
            ),
            SizedBox(
              width: 324.w,
              height: 48.h,
              child: TextFormField(
                style: const TextStyle(color: whiteColor),
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: false,
                  hintText: 'Enter First Name',
                  hintStyle: TextStyle(color: textTitleColor.withOpacity(0.5)),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: whiteColor),
                    //BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
              SizedBox(
              height: 15.h,
            ),
              Padding(
              padding: EdgeInsets.only(right: 210.dm),
              child: SubTitle(
                text: 'Last Name',
                size: 22,
                color: whiteColor,
                weight: FontWeight.w800,
              ),
            ),
            SizedBox(
              width: 324.w,
              height: 48.h,
              child: TextFormField(
                style: const TextStyle(color: whiteColor),
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: false,
                  hintText: 'Enter Last Name',
                  hintStyle: TextStyle(color: textTitleColor.withOpacity(0.5)),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: whiteColor),
                    //BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
             SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.only(right: 170.dm),
              child: SubTitle(
                text: 'Mobile Number',
                size: 22,
                color: whiteColor,
                weight: FontWeight.w800,
              ),
            ),
            SizedBox(
              width: 324.w,
              height: 48.h,
              child: TextFormField(
                style: const TextStyle(color: whiteColor),
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: false,
                  hintText: 'Enter Your Number',
                  hintStyle: TextStyle(color: textTitleColor.withOpacity(0.5)),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: whiteColor),
                    //BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 300.h,),
            CustomBouttn3(text: 'Save',),
          ],
        ),
      ),
    );
  }
}
