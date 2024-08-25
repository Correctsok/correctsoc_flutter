import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/custom_bouttn.dart';
import '../../../../core/utils/app_colors.dart';

class PaymentSuccessfully extends StatefulWidget {
  const PaymentSuccessfully({super.key});

  @override
  State<PaymentSuccessfully> createState() => _PaymentSuccessfullyState();
}

class _PaymentSuccessfullyState extends State<PaymentSuccessfully> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite.w,
        height: double.maxFinite.h,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bc4.png'), fit: BoxFit.cover)),
        child: SingleChildScrollView(
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
                          // navigateTo(context, const PaymentMethod());
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
              Image.asset('assets/images/next3.png', width: 225.w),
              SizedBox(
                height: 25.h,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 640.h,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      gradient: LinearGradient(
                        colors: [bg6, bg8.withOpacity(0.2)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 120.h,),
                        Image.asset('assets/images/successfullydon.png',width: 180.w,),
                        SizedBox(height: 100.h,),
                        CustomBouttn3(
                          text: 'Done',
                          onTap: () {
                            // navigateTo(context, const PaymentMethod());
                          },
                        )
                      ],
                    ),
                  )),

            ],
          ),
        ),
      ),
    );
  }
}
