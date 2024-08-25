import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../core/cache_helper/dio_helper.dart';
import '../../../../data/model/user_data_model.dart';
import '../../../../data/shared/local_network.dart';

part 'autch_state.dart';

class AutchCubit extends Cubit<AutchState> {
  AutchCubit() : super(AutchInitial());
  static AutchCubit get(context) => BlocProvider.of(context);

  UserData? userData;

  void login(
      {required String phone,
      required String password,
      required String deviceId}) {
    emit(LoginLoadingState());
    DioHelper.postData(
        url: 'http://correctsocandroid.somee.com/api/Authentication/SignIn',
        data: {
          "phoneNumber": phone,
          "password": password,
          "deviceId": deviceId,
        }).then((value) {
      // print(value.data);
      userData = UserData.fromJson(value.data);
      emit(LoginSuccessState(usermodel: userData!));
    }).catchError((error) {
      // printFullText(error.toString());
      emit(FailedLoginState(errorMessages: error.toString()));
    });
  }

  void submitForm(
      {required String phone, required String password, required String name}) {
    emit(RegisterLoadingState());
    DioHelper.postData(
        url: 'http://correctsocandroid.somee.com/api/Authentication/Register',
        data: {
          "name": name,
          "phone": phone,
          "password": password
        }).then((value) {
      print(value.data['isSuccess']);
      // userData = UserData.fromJson(value.data);
      emit(RegisterSuccessState());
    }).catchError((error) {
      // printFullText(error.toString());
      emit(FailedToRegisterState(errorMessages: error.toString()));
    });
  }

  void verifyOtp({required String phone, required String otp}) {
    emit(OtpLoadingState());
    DioHelper.postData(
        url:
            'http://correctsocandroid.somee.com/api/Authentication/ConfirmPhone',
        data: {
          "phone": phone,
          "otp": otp,
        }).then((value) async{
      // printFullText(value.data);
      userData = UserData.fromJson(value.data);
     await CacheNetwork.insertToCache(key: 'token', value: userData!.result.token);
      emit(OtpSuccessState(usermodel:  userData!));
    }).catchError((error) {
      // printFullText(error.toString());
      emit(FailedToOtpState(errorMessages: error.toString()));
    });
  }
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