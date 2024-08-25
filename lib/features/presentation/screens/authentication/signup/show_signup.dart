import 'package:correctsoc/core/components/components.dart';
import 'package:correctsoc/features/presentation/screens/authentication/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/components/custom_bouttn.dart';
import '../../../../../core/components/sub_title.dart';
import '../../../../../core/utils/app_colors.dart';

class ShowSignup extends StatelessWidget {
  const ShowSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bc2.png'), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 80.h,
            ),
            SubTitle(
                text: 'Welcome to CorrectSOC',
                size: 30,
                color: whiteColor,
                weight: FontWeight.w600),
            SubTitle(
                text:
                    'Protect your privacy effortlessly with our Anti-Spy\nMobile App - Sign up now to stay secure!',
                size: 14,
                color: textTitleColor.withOpacity(0.3),
                weight: FontWeight.w600),
                SizedBox(height: 450.h,),
                 CustomBouttn5(text: 'Sign Up',onTap: (){
                  navigateTo(context, const SignUP());
                 },),
                 SizedBox(height: 10.h,),
                  SubTitle(
                text: 'Already have an account ?',
                size: 14,
                color: whiteColor.withOpacity(0.4),
                weight: FontWeight.w500),
                TextButton(onPressed: (){},
                 child: SubTitle(
                text: 'Sign in',
                size: 14,
                color: whiteColor.withOpacity(0.5),
                weight: FontWeight.w600),
                 )
          ],
        ),
      ),
    );
  }
}
