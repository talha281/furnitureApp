import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furniture_app/data/models/user_model.dart';
import 'package:furniture_app/data/repository/interfaces/i_user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final IUserRepository userRepository;
  final SharedPreferences sharedPreferences;
  UserBloc(this.userRepository, this.sharedPreferences) : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    String firebaseId = await userRepository.userId;
    UserModel user = await userRepository.checkUserOnServer(firebaseId);
    if (user.username == null) {
      if (event is UpdateUserEvent) {
        await userRepository.storeUser(event.user);
      }
      yield UserLoading();
      yield NewUserState();
    } else {
      if (event is UpdateUserEvent) {
        yield UserLoading();
        await userRepository.storeUser(event.user);
        yield RegisteredUserState(
            user: event.user); //todo add firebaseId and userId.
      } else {
        yield RegisteredUserState(user: user);
      }
    }
  }
}
