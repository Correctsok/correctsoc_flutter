
import 'package:correctsoc/core/components/components.dart';
import 'package:correctsoc/features/presentation/screens/payment/payment_method.dart';
import 'package:correctsoc/features/presentation/screens/payment/payment_successfully.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/custom_bouttn.dart';
import '../../../../core/components/sub_title.dart';
import '../../../../core/utils/app_colors.dart';

class ActivationCode extends StatefulWidget {
  const ActivationCode({super.key});

  @override
  State<ActivationCode> createState() => _ActivationCodeState();
}

class _ActivationCodeState extends State<ActivationCode> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: double.maxFinite.w,
        height: double.maxFinite.h,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bc4.png'), fit: BoxFit.cover)),
        child: Column(
          children: [
            SizedBox(height: 60.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                         navigateTo(context, const PaymentMethod());
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: whiteColor,
                        size: 25,
                      )),
                  const SizedBox(),

                ],
              ),
            ),
            SizedBox(height: 20.w,),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: SubTitle(
                      text: 'Activation Code',
                      size: 17,
                      color: textTitleColor.withOpacity(0.7),
                      weight: FontWeight.w600)),
            ),
            SizedBox(height: 6.h,),
            SizedBox(
              width: 324.w,
              height: 48.h,
              child: TextFormField(
                keyboardType: TextInputType.text,
                obscureText: false,
                style: const TextStyle(color: whiteColor),
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: false,
                  hintText: 'Enter Code',
                  hintStyle:  TextStyle(color: textTitleColor.withOpacity(0.3)),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: whiteColor),
                    //BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 450.h,),
            CustomBouttn3(
              text: 'Done',
              onTap: () {
                 navigateTo(context, const PaymentSuccessfully());
              },
            )
          ],
        ),
      ),
    );
  }
}

//payment_successfully   PaymentSuccessfully Done
