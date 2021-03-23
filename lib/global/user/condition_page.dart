import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_app/global/auth/bloc/authentication_bloc.dart';
import 'package:furniture_app/login/login_page.dart';
import 'package:furniture_app/register_user/register_user.dart';
import 'package:furniture_app/screens/dashboard/dashboard.dart';
import 'package:furniture_app/splash_screen.dart';
import 'bloc/user_bloc.dart';

class ConditionPage extends StatelessWidget {
//   // _getLoggedInUser(BuildContext context, UserModel user) async {
//   //   UserModel _user = await checkLogin();

//   //   if (_user.username == null) {
//   //     UserRepositoryFunctions().storeUser(user, context);
//   //   }
//   // }

//   // _getUser(BuildContext context) async {
//   //   // UserModel user = await UserRepositoryFunctions().sendToNext();
//   //   // if (user.username != null) {
//   //   //   BlocProvider.of<AuthenticationBloc>(context).add(NotNewUserEvent());
//   //   // } else
//   // }

  @override
  Widget build(BuildContext context) {
    //  _getUser(context);
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        if (state is NewUserState) {
          return SignUpPage();
        } else if (state is RegisteredUserState) {
          return Dashboard();
        } else if (state is Unauthenticated) {
          return LoginPage();
        } else {
          return SplashScreen();
        }
      });
    });
  }
}
