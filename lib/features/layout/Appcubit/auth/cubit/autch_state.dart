part of 'autch_cubit.dart';

@immutable
sealed class AutchState {}

final class AutchInitial extends AutchState {}

class LoginLoadingState extends AutchState{}
class LoginSuccessState extends AutchState{
  final UserData usermodel;

  LoginSuccessState({required this.usermodel});
}
class FailedLoginState extends AutchState{
  final String errorMessages;
  FailedLoginState({required this.errorMessages});
}


class RegisterLoadingState extends AutchState{}
class RegisterSuccessState extends AutchState{
  //  final UserData usermodel;
}
class FailedToRegisterState extends AutchState{
  final String errorMessages;
  FailedToRegisterState({required this.errorMessages});
}


class OtpLoadingState extends AutchState{}
class OtpSuccessState extends AutchState{
   final UserData usermodel;

  OtpSuccessState({required this.usermodel});
}
class FailedToOtpState extends AutchState{
  final String errorMessages;
  FailedToOtpState({required this.errorMessages});
}


