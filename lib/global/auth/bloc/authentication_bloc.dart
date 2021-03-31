import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:furniture_app/data/models/user_model.dart';
import 'package:furniture_app/data/repository/interfaces/i_user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final IUserRepository? userRepository;
  AuthenticationBloc(this.userRepository) : super(InitialAuthentication());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      print('this is App Started ');
      UserModel? storedUser = await userRepository!.getUser();
      final bool hasToken = storedUser!.username != null;
      print('this is token $hasToken');
      if (hasToken) {
        UserModel? user = await userRepository!.getUser();
        print(user);
        yield AuthenticatedState(user: user);
      } else {
        yield Unauthenticated();
      }
    } else if (event is AlreadyLoggedIn) {
      yield AlreadyLoggedInState();
    } else if (event is LoggedInEvent) {
      yield Loading();

      // String uid = await userRepository.getUser().then((value) => value?.uid ?? 'UID NULL');
      yield AuthenticatedState(firebaseUser: event.firebaseUser);
    } else if (event is LoggedOutEvent) {
      await userRepository!.signOut();
      yield Loading();
      yield Unauthenticated();
    }
  }
}
