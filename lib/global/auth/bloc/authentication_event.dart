part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object?> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class AlreadyLoggedIn extends AuthenticationEvent {}

class LoggedInEvent extends AuthenticationEvent {
  final User? firebaseUser;

  LoggedInEvent({
    this.firebaseUser,
  });
  @override
  List<Object?> get props => [firebaseUser];
}

class LoggedOutEvent extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}
