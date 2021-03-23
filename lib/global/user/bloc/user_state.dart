part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {}

class NewUserState extends UserState {}

class RegisteredUserState extends UserState {
  final UserModel user;

  RegisteredUserState({required this.user});
  @override
  List<Object?> get props => [user];
}

class UserLoading extends UserState {}
