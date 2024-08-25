import 'package:correctsoc/core/components/components.dart';
import 'package:correctsoc/core/components/sub_title.dart';
import 'package:correctsoc/core/utils/app_colors.dart';
import 'package:correctsoc/features/presentation/screens/authentication/login/login_screen.dart';
import 'package:correctsoc/features/presentation/screens/authentication/signup/show_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/custom_bouttn.dart';

class AuthBording extends StatelessWidget {
  const AuthBording({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bc1.png'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SubTitle(
                    text: 'Anti-Spy Application',
                    size: 30,
                    color: whiteColor,
                    weight: FontWeight.w600),
                SubTitle(
                    text:
                        'Protect your privacy effortlessly with our Anti-Spy\nMobile App - Sign up now to stay secure!',
                    size: 14,
                    color: textTitleColor.withOpacity(0.3),
                    weight: FontWeight.w600),
                SizedBox(
                  height: 20.h,
                ),
                CustomBouttn3(
                  text: 'Login',
                  onTap: () {
                    navigateTo(context, const LoginScreen());
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomBouttn4(
                  text: 'Sign Up',
                  onTap: () {
                    navigateTo(context, const ShowSignup());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
