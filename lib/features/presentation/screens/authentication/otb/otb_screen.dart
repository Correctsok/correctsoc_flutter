// ignore_for_file: unused_field

import 'dart:async';
import 'dart:convert';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:correctsoc/features/presentation/screens/home/home_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../../../core/components/components.dart';
import '../../../../../core/components/sub_title.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../layout/Appcubit/auth/cubit/autch_cubit.dart';

class OtbScreen extends StatefulWidget {
  final String phone;
  const OtbScreen({super.key, required this.phone});

  @override
  State<OtbScreen> createState() => _OtbScreenState();
}

class _OtbScreenState extends State<OtbScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _otpController = TextEditingController();
  String phone = '';
  final String _response = '';
  Timer? _timer;
  int _remainingTime = 120;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _remainingTime = 120;
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer!.cancel();
        }
      });
    });
  }

  void resendCode({required phone}) async {
    var headers = {'Accept': 'application/json'};
    var dio = Dio();
    var response = await dio.request(
      'http://correctsocandroid.somee.com/api/Authentication/SendNewOTP?phone=$phone',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }
    print("Code resent!");
    startTimer();
  }

  String get timerText {
    final minutes = (_remainingTime ~/ 60).toString().padLeft(2, '0');
    final seconds = (_remainingTime % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }

  // Future<void> _verifyOtp() async {
  //   var headers = {
  //     'Accept': 'application/json',
  //     'Content-Type': 'application/json',
  //   };
  //   var data = json.encode({
  //     "phone": widget.phone,
  //     "otp": _otpController.text,
  //   });

  //   var dio = Dio();
  //   try {
  //     var response = await dio.request(
  //       'http://correctsocandroid.somee.com/api/Authentication/ConfirmPhone',
  //       options: Options(
  //         method: 'POST',
  //         headers: headers,
  //       ),
  //       data: data,
  //     );

  //     if (response.statusCode == 200) {
  //       setState(() {
  //         _response = json.encode(response.data);

  //       });
  //       print(data);
  //        navigateAndFinish(context, const HomePageView());
  //     } else {
  //       setState(() {
  //         _response = response.statusMessage ?? 'Error';
  //       });
  //     }
  //   } catch (e) {
  //     setState(() {
  //       _response = 'Error: $e';
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 40,
      height: 40,
      textStyle: const TextStyle(
        fontSize: 22,
        color: whiteColor,
      ),
      decoration: BoxDecoration(
        color: v4Color,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.transparent),
      ),
    );
    return BlocProvider(
      create: (context) => AutchCubit(),
      child: BlocConsumer<AutchCubit, AutchState>(
        listener: (context, state) {
           if(state is OtpSuccessState){
            if(state.usermodel.isSuccess){
              printFullText(state.usermodel.result.token.toString());
              //  printFullText(state.usermodel.result.userId.toString());
              //   printFullText(state.usermodel.errorMessages);
               navigateAndFinish(context, const HomePageView());
            }else{
              
            }
          //  navigateAndFinish(context,  const HomePageView());
           
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bc3.png'),
                    fit: BoxFit.cover),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(children: [
                    SizedBox(
                      height: 400.h,
                    ),
                    SubTitle(
                        text: 'Check your phone',
                        size: 30,
                        color: whiteColor,
                        weight: FontWeight.w600),
                    //398238900743
                    SubTitle(
                        text:
                            'Please enter the verification code sent\nto +2$phone',
                        size: 14,
                        color: textTitleColor.withOpacity(0.3),
                        weight: FontWeight.w600),
                    SizedBox(
                      height: 30.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Pinput(
                          controller: _otpController,
                          length: 6,
                          defaultPinTheme: defaultPinTheme,
                          focusedPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              border: Border.all(color: v4Color),
                            ),
                          ),
                          onCompleted: (pin) => debugPrint(pin),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SubTitle(
                            text: 'Code Expire in',
                            size: 16,
                            color: whiteColor.withOpacity(0.3),
                            weight: FontWeight.w600),
                        SizedBox(
                          width: 7.w,
                        ),
                        SubTitle(
                            text: timerText,
                            size: 16,
                            color: whiteColor,
                            weight: FontWeight.w600),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    ConditionalBuilder(
                        condition: state is! OtpLoadingState,
                        builder: (context) => InkWell(
                              onTap: () {
                                 AutchCubit.get(context).verifyOtp(
                                  phone: widget.phone, otp: _otpController.text,
                                  );
                              },
                              //  _verifyOtp,
                              child: Container(
                                width: 288.w,
                                height: 42.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: const LinearGradient(
                                    colors: [bg1, bg2],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: Center(
                                  child: SubTitle(
                                      text: 'Verify',
                                      size: 16,
                                      color: bg5,
                                      weight: FontWeight.bold),
                                ),
                              ),
                            ),
                        fallback: (context) =>
                            const CircularProgressIndicator()),

                    SizedBox(
                      height: 15.h,
                    ),
                    // CustomBouttn4(text: 'Send again',),
                    InkWell(
                      onTap: () {
                        resendCode(phone: widget.phone);
                      },
                      child: Container(
                        width: 288.w,
                        height: 42.h,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: whiteColor),
                        ),
                        child: Center(
                          child: SubTitle(
                              text: 'Send again',
                              size: 16,
                              color: whiteColor,
                              weight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
