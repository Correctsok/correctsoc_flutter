// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:correctsoc/features/presentation/screens/payment/payment_details.dart';
import 'package:correctsoc/features/presentation/screens/payment/widget/custom_radio_buttonlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/components.dart';
import '../../../../core/components/custom_bouttn.dart';
import '../../../../core/components/sub_title.dart';
import '../../../../core/utils/app_colors.dart';
import 'activation_code.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int _value = 1;
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
                          navigateTo(context, const PaymentDetails());
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
              Image.asset('assets/images/next2.png', width: 225.w),
              SizedBox(
                height: 25.h,
              ),
              Container(
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25.h,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: SubTitle(
                              text: 'Payment Method',
                              size: 20,
                              color: whiteColor,
                              weight: FontWeight.w600)),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: SubTitle(
                              text: 'Select one of the payment methods ',
                              size: 17,
                              color: textTitleColor.withOpacity(0.5),
                              weight: FontWeight.w600)),
                      SizedBox(
                        height: 30.h,
                      ),
                      CustomRadioButtonListTile(
                        value: 1,
                        groupValue: _value,
                        title: 'assets/icons/googlebay2.png',
                        onChanged: (value) {
                          setState(() {
                            _value = value;
                          });
                        },
                      ),
                      SizedBox(height: 10.h,),
                      CustomRadioButtonList(
                        value: 2,
                        groupValue: _value,
                        title: 'data',
                        onChanged: (value) {
                          setState(() {
                            _value = value;
                          });
                        },
                      ),
                      SizedBox(height: 190.h,),
                      CustomBouttn3(
                        text: 'Next',
                        onTap: () {
                          navigateTo(context, const ActivationCode());
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//activation_code


