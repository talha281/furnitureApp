part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class CheckUserEvent extends UserEvent {}


class UpdateUserEvent extends UserEvent {
  final UserModel user;

  UpdateUserEvent(this.user);

  @override
  List<Object> get props => [user];
}

class UpdateUserImage extends UserEvent {
  final File file;

  UpdateUserImage(this.file);
  @override
  List<Object> get props => [file];
}

