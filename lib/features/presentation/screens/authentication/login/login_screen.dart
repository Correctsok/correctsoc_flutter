import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:correctsoc/core/components/components.dart';
import 'package:correctsoc/features/presentation/screens/home/home_page.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/components/custom_bouttn.dart';
import '../../../../../core/components/sub_title.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../layout/Appcubit/auth/cubit/autch_cubit.dart';
import '../forget&resetpassword/forgetpassword.dart';
import '../signup/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  String deviceId = '';
  bool _isSecurePassword = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getDeviceId();
  }

  Future<void> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String? deviceId;

    try {
      if (Theme.of(context).platform == TargetPlatform.android) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        deviceId = androidInfo.id; // استخدام id كـ deviceId
      } else if (Theme.of(context).platform == TargetPlatform.iOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceId = iosInfo
            .identifierForVendor; // استخدام identifierForVendor كـ deviceId
      }
    } catch (e) {
      deviceId = 'Failed to get deviceId: $e';
    }

    setState(() {
      this.deviceId = deviceId ?? 'Unknown';
      print(deviceId);
    });
  }

  Widget togglePassword(){
    return InkWell(
      onTap: (){
        setState(() {
          _isSecurePassword = !_isSecurePassword;
        });
      },
      child: _isSecurePassword
      ? Image.asset('assets/icons/visibility.png')
      : Image.asset('assets/icons/visibility.png')
       );
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AutchCubit(),
      child: BlocConsumer<AutchCubit, AutchState>(
        listener: (context, state) {
          // navigateAndFinish(context, const HomePageView());
          if(state is LoginSuccessState){
            if(state.usermodel.isSuccess){
              printFullText(state.usermodel.result.token.toString());
               printFullText(state.usermodel.result.userId.toString());
               navigateAndFinish(context, const HomePageView());
            }else{
               printFullText(state.usermodel.result.name);
            }
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
                        height: 425.h,
                      ),
                      SubTitle(
                          text: 'Welcome Back',
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your Mobile number';
                            }
                            return null;
                          },
                          style: const TextStyle(color: whiteColor),
                          decoration: InputDecoration(
                            fillColor: Colors.transparent,
                            filled: false,
                            hintText: 'Mobile number',
                            hintStyle: TextStyle(
                                color: textTitleColor.withOpacity(0.3)),
                            // errorStyle: const TextStyle(color: v1Color),
                            // errorBorder: const OutlineInputBorder(
                            //   borderSide: BorderSide(
                            //     color: v1Color,
                            //     width: 2.0,
                            //   ),
                            // ),
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
                          obscureText: _isSecurePassword,
                          controller: _passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'password is too short';
                            }
                          },
                          style: const TextStyle(color: whiteColor),
                          decoration: InputDecoration(
                            fillColor: Colors.transparent,
                            filled: false,
                            hintText: 'Passwordr',
                            hintStyle: TextStyle(
                                color: textTitleColor.withOpacity(0.3)),
                            // errorStyle: const TextStyle(color: v1Color),
                            // errorBorder:OutlineInputBorder(
                            //   borderSide:  BorderSide.none,
                            //   //BorderSide.none,
                            //   borderRadius: BorderRadius.circular(10),
                            // ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/icons/lock2.png'),
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: togglePassword(),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: whiteColor),
                              //BorderSide.none,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(24.0),
                            child: CircleAvatar(
                              backgroundColor: whiteColor,
                              radius: 8,
                              child: Icon(
                                Icons.check,
                                color: bg5,
                                size: 10,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 150.w,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                              onPressed: () {
                                navigateTo(context, const ForgetPassword());
                              },
                              child: SubTitle(
                                  text: 'Forget Password ?',
                                  size: 14,
                                  color: whiteColor,
                                  weight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          builder: (context) => CustomBouttn5(
                                text: 'Login',
                                onTap: () {
                                   AutchCubit.get(context).login(
                                        phone: _phoneController.text,
                                        password: _passwordController.text,
                                        deviceId: deviceId);
                                },
                              ),
                          fallback: (context) =>
                              const CircularProgressIndicator()),
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
                            onPressed: ()=> navigateTo(context, const SignUP()),
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

//forgetpassword ForgetPassword