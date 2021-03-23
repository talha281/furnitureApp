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
      final bool hasToken = userRepository!.getUser() != null;

      if (hasToken) {
        User? firebaseUser = userRepository!.getUser();
        yield AuthenticatedState(firebaseUser);
      } else {
        yield Unauthenticated();
      }
    } else if (event is AlreadyLoggedIn) {
      yield AlreadyLoggedInState();
    } else if (event is LoggedInEvent) {
      yield Loading();

      // String uid = await userRepository.getUser().then((value) => value?.uid ?? 'UID NULL');
      yield AuthenticatedState(event.firebaseUser);
    } else if (event is LoggedOutEvent) {
      await userRepository!.signOut();
      yield Loading();
      yield Unauthenticated();
    }
  }
}
