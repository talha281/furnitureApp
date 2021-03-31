import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_app/data/repository/user/i_user_repository.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final IUserRepository userRepository;

  LoginBloc({required this.userRepository}) : super(LoginInitial());
  String verID = '';
  late StreamSubscription subscription;
  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is SendOtpEvent) {
      yield LoadingState();
      subscription = sendOtp(
        event.phoNo,
      ).listen((event) {
        add(event);
      });
    } else if (event is OtpSendEvent) {
      yield OtpSentState();
    } else if (event is LoginCompleteEvent) {
      //sendToNext function will be called.
      yield LoginCompleteState(event.firebaseUser);
    } else if (event is LoginExceptionEvent) {
      yield ExceptionState(message: event.message);
    } else if (event is VerifyOtpEvent) {
      yield LoadingState();
      try {
        UserCredential result =
            await userRepository.verifyAndLogin(verID, event.otp);
        if (result.user != null) {
          //sendToNext function
          yield LoginCompleteState(result.user);
        } else {
          yield OtpExceptionState(message: "Invalid otp!");
        }
      } catch (e) {
        yield OtpExceptionState(message: "Invalid otp!");
        print(e);
      }
    }
  }

  @override
  void onEvent(LoginEvent event) {
    super.onEvent(event);
    print(event);
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    super.onError(error, stacktrace);
    print(stacktrace);
  }

  Future<void> close() async {
    print("Bloc closed");
    subscription.cancel();
    super.close();
  }

  Stream<LoginEvent> sendOtp(String? phoNo) async* {
    StreamController<LoginEvent> eventStream = StreamController();
    final phoneVerificationCompleted = (AuthCredential authCredential) async {
      await userRepository.signInFirebase(authCredential);
      User? user = userRepository.getUser();
      eventStream.add(LoginCompleteEvent(user));
      // eventStream.close();
    };
    final phoneVerificationFailed = (FirebaseAuthException authException) {
      String? errorMessage = authException.message;
      print(errorMessage);
      eventStream.add(LoginExceptionEvent(errorMessage));
      eventStream.close();
    };
    final phoneCodeSent = (String verId, [int? forceResent]) {
      this.verID = verId;
      eventStream.add(OtpSendEvent());
    };
    final phoneCodeAutoRetrievalTimeout = (String verid) {
      this.verID = verid;
      eventStream.close();
    };

    await userRepository.sendOtp(
        phoNo,
        Duration(seconds: 60),
        phoneVerificationFailed,
        phoneVerificationCompleted,
        phoneCodeSent,
        phoneCodeAutoRetrievalTimeout);

    yield* eventStream.stream;
  }
}
