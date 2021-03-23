import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_app/global/auth/bloc/authentication_bloc.dart';
import 'package:furniture_app/screens/dashboard/dashboard.dart';
import 'package:furniture_app/splash_screen.dart';

import 'global/user/bloc/user_bloc.dart';
import 'global/user/condition_page.dart';
import 'login/login_page.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is InitialAuthentication) {
          return SplashScreen();
        } else if (state is Unauthenticated) {
          return LoginPage();
        } else if (state is AuthenticatedState) {
          BlocProvider.of<UserBloc>(context).add(CheckUserEvent());
          return ConditionPage();
        } else if (state is AlreadyLoggedInState) {
          return Dashboard();
        } else {
          return SplashScreen();
        }
      },
    );
  }
}
