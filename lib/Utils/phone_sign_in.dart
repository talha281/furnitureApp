import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/data/models/user_model.dart';
import 'package:furniture_app/data/repository/user/i_user_repository.dart';
import 'package:furniture_app/ui/dashboard/dashboard.dart';
import 'package:furniture_app/ui/login/otp_page.dart';
import 'package:furniture_app/ui/register_user/register_user.dart';
import 'package:furniture_app/utils/firebaseid.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PhoneSignIn {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // AuthCredential _credential;
  //
  Future<UserModel> checkUserOnServer(String firebaseId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? _user = pref.getString('User');
    if (_user != null) {
      return Future.value(UserModel.fromJson(_user));
    } else {
      return Future.value(UserModel());
    }
  }

  _storeUser(UserModel user, BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var userConvert = json.encode(user.toJson());
    pref.setString('User', userConvert);
    Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
            child: Dashboard(), type: PageTransitionType.rightToLeftWithFade),
        (Route<dynamic> route) => false);
  }

  Future registerUser(String mobile, BuildContext context) async {
    _auth.verifyPhoneNumber(
      phoneNumber: mobile,
      timeout: Duration(seconds: 60),
      verificationCompleted: (AuthCredential authCredential) async {
        UserCredential result =
            await _auth.signInWithCredential(authCredential).catchError((e) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('Error'),
                    content: Text(e.toString()),
                  ));

          print(e);
        });
        if (result.user != null) {
          _sendToNext(context, mobile);
        }
      },
      verificationFailed: (FirebaseAuthException authException) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('Error'),
                  content: Text(authException.message!),
                ));
        print(authException.message);
      },
      codeSent: (String verificationId, [int? forceResendingToken]) async {
        FirebaseAuth auth = FirebaseAuth.instance;
        var token = await Navigator.push(
          context,
          PageTransition(
            child:OtpPage(),
            type: PageTransitionType.rightToLeftWithFade,
          ),
        );

        AuthCredential _credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: token);

        UserCredential result =
            await auth.signInWithCredential(_credential).catchError((e) {
          // Navigator.pop(context);
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('Error'),
                    content: Text(e.toString()),
                  ));
          print(e);
        });
        if (result.user != null) {
          _sendToNext(context, mobile);
        }
      },
      codeAutoRetrievalTimeout: (String e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text(e),
          ),
        );
      },
    );
  }

  _sendToNext(BuildContext context, String mobile) async {
    String id = await getUserId();
    UserModel user = await checkUserOnServer(id);
    if (user.username != null) {
      await _storeUser(user, context);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          PageTransition(
              child: SignUpPage(),
              type: PageTransitionType.rightToLeftWithFade),
          (Route<dynamic> route) => false);
    }
  }
}
