
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/components/custom_bouttn.dart';
import '../../../../../core/components/sub_title.dart';
import '../../../../../core/utils/app_colors.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 425.h,
              ),
              SubTitle(
                  text: 'Enter your phone',
                  size: 30,
                  color: whiteColor,
                  weight: FontWeight.w600),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: 324.w,
                height: 48.h,
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(color: whiteColor),
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    filled: false,
                    hintText: 'Mobile number',
                     hintStyle:  TextStyle(color: textTitleColor.withOpacity(0.3)),
                    prefixIcon:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/icons/phone.png'),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: whiteColor),
                      //BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50,),
               CustomBouttn5(text: 'Send',onTap: (){
                // navigateTo(context, const OtbScreen());
               },),
             
            
            ],
          ),
        ),
      ),
    );
  }
}

