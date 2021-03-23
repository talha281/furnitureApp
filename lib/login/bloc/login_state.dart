part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  // @override
  // List<Object> get props => [];
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class OtpSentState extends LoginState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class LoadingState extends LoginState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class OtpVerifiedState extends LoginState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class LoginCompleteState extends LoginState {
  final User? firebaseUser;

  LoginCompleteState(this.firebaseUser);

  @override
  List<Object?> get props => [firebaseUser];
}
