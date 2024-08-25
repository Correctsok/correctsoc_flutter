
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:correctsoc/features/presentation/screens/authentication/otb/otb_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/components/components.dart';
import '../../../../../core/components/custom_bouttn.dart';
import '../../../../../core/components/sub_title.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../layout/Appcubit/auth/cubit/autch_cubit.dart';
import '../login/login_screen.dart';

class SignUP extends StatefulWidget {
  const SignUP({super.key});

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AutchCubit(),
      child: BlocConsumer<AutchCubit, AutchState>(
        listener: (context, state) {
         if(state is RegisterSuccessState){
           navigateAndFinish(context,  OtbScreen(phone: _phoneController.text,));
           
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
                  child: Column(
                    children: [
                      SizedBox(
                        height: 350.h,
                      ),
                      SubTitle(
                          text: 'Create account',
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
                          controller: _phoneController,
                          style: const TextStyle(color: whiteColor),
                          decoration: InputDecoration(
                            fillColor: Colors.transparent,
                            filled: false,
                            hintText: 'Mobile number',
                            hintStyle: TextStyle(
                                color: textTitleColor.withOpacity(0.3)),
                            prefixIcon: Padding(
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
                      SizedBox(
                        height: 15.h,
                      ),
                      SizedBox(
                        width: 324.w,
                        height: 48.h,
                        child: TextFormField(
                          controller: _nameController,
                          style: const TextStyle(color: whiteColor),
                          decoration: InputDecoration(
                            fillColor: Colors.transparent,
                            filled: false,
                            hintText: 'Mobile number',
                            hintStyle: TextStyle(
                                color: textTitleColor.withOpacity(0.3)),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/icons/person.png'),
                            ),
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
                      SizedBox(
                        width: 324.w,
                        height: 48.h,
                        child: TextFormField(
                          controller: _passwordController,
                          style: const TextStyle(color: whiteColor),
                          decoration: InputDecoration(
                            fillColor: Colors.transparent,
                            filled: false,
                            hintText: 'Passwordr',
                            hintStyle: TextStyle(
                                color: textTitleColor.withOpacity(0.3)),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/icons/lock2.png'),
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/icons/visibility.png'),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: whiteColor),
                              //BorderSide.none,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      //    SizedBox(height: 15.h,),
                      //     SizedBox(
                      //   width: 324.w,
                      //   height: 48.h,
                      //   child: TextFormField(
                      //     style: const TextStyle(color: whiteColor),
                      //     decoration: InputDecoration(
                      //       fillColor: Colors.transparent,
                      //       filled: false,
                      //       hintText: 'VerifyCode',
                      //       hintStyle:  TextStyle(color: textTitleColor.withOpacity(0.3)),
                      //       prefixIcon:  Padding(
                      //         padding: const EdgeInsets.all(8.0),
                      //         child: Image.asset('assets/icons/code.png'),
                      //       ),
                      //       // suffixIcon: Padding(
                      //       //   padding: const EdgeInsets.all(8.0),
                      //       //   child: Image.asset('assets/icons/code.png'),
                      //       // ),
                      //       border: OutlineInputBorder(
                      //         borderSide: const BorderSide(color: whiteColor),
                      //         //BorderSide.none,
                      //         borderRadius: BorderRadius.circular(10),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 20.h,
                      ),
                       ConditionalBuilder(
                          condition: state is! RegisterLoadingState,
                          builder: (context) => CustomBouttn5(
                               text: 'Sign Up',
                                onTap: () {
                                   AutchCubit.get(context).submitForm(
                                        phone: _phoneController.text,
                                        password: _passwordController.text,
                                        name: _nameController.text
                                        );
                                },
                              ),
                          fallback: (context) =>
                              const CircularProgressIndicator()),
                      // CustomBouttn5(
                      //   text: 'Sign Up',
                      //   onTap: _submitForm,
                      // ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SubTitle(
                              text: 'Dont have account ?',
                              size: 14,
                              color: whiteColor.withOpacity(0.3),
                              weight: FontWeight.bold),
                          TextButton(
                            onPressed: () =>
                                navigateTo(context, const LoginScreen()),
                            child: SubTitle(
                                text: 'Sign up',
                                size: 14,
                                color: whiteColor,
                                weight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
