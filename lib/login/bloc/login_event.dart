part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class SendOtpEvent extends LoginEvent {
  final String? phoNo;
  final BuildContext? context;

  SendOtpEvent({this.phoNo, this.context});
}

class AppStartEvent extends LoginEvent {}

class VerifyOtpEvent extends LoginEvent {
  final String? otp;

  VerifyOtpEvent({this.otp});
}

class LogoutEvent extends LoginEvent {}

class OtpSendEvent extends LoginEvent {}

class LoginCompleteEvent extends LoginEvent {
  final User? firebaseUser;
  LoginCompleteEvent(this.firebaseUser);
}

class LoginExceptionEvent extends LoginEvent {
  final String? message;

  LoginExceptionEvent(this.message);
}

class ExceptionState extends LoginState {
  final String? message;

  ExceptionState({this.message});

  @override
  List<Object?> get props => [message];
}

class OtpExceptionState extends LoginState {
  final String? message;

  OtpExceptionState({this.message});

  @override
  List<Object?> get props => [message];
}
