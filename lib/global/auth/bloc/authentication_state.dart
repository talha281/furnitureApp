part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object?> get props => [];
}

class InitialAuthentication extends AuthenticationState {}

class UnInitializedState extends AuthenticationState {}

class AuthenticatedState extends AuthenticationState {
  final User? firebaseUser;
  final UserModel? user;

  AuthenticatedState({this.firebaseUser,this.user});

  @override
  List<Object?> get props => [firebaseUser,user];
}

class Unauthenticated extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class AlreadyLoggedInState extends AuthenticationState {}

class Loading extends AuthenticationState {
  @override
  List<Object> get props => [];
}
