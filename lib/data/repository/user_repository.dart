import 'dart:io';
import "package:firebase_auth/firebase_auth.dart";
import 'package:furniture_app/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'interfaces/i_user_repository.dart';

const USER = 'user';

class UserRepository implements IUserRepository {
  final FirebaseAuth _firebaseAuth;
  final SharedPreferences sharedPreferences;

  UserRepository(
    this._firebaseAuth,
    this.sharedPreferences,
  );
  Future<UserModel> get user async {
    String? user = sharedPreferences.getString(USER);
    if (user != null) {
      return UserModel.fromJson(user);
    } else {
      throw Exception('User was called without being stored');
    }
  }

  Future<void> sendOtp(
      String? phoneNumber,
      Duration timeOut,
      PhoneVerificationFailed phoneVerificationFailed,
      PhoneVerificationCompleted phoneVerificationCompleted,
      PhoneCodeSent phoneCodeSent,
      PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout) async {
    _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber!,
        timeout: timeOut,
        verificationCompleted: phoneVerificationCompleted,
        verificationFailed: phoneVerificationFailed,
        codeSent: phoneCodeSent,
        codeAutoRetrievalTimeout: autoRetrievalTimeout);
  }

  Future<void> signInFirebase(AuthCredential credential) async {
    _firebaseAuth.signInWithCredential(credential);
  }

  Future<UserCredential> verifyAndLogin(
      String verificationId, String? smsCode) async {
    AuthCredential authCredential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode!);

    return await _firebaseAuth.signInWithCredential(authCredential);
  }

  User? getUser() {
    User? user = _firebaseAuth.currentUser;
    return user;
  }

  Future<void> signOut() async {
    await sharedPreferences.remove(USER);
    return _firebaseAuth.signOut();
  }

  Future<UserModel> checkUserOnServer(String firebaseId) {
    String? _user = sharedPreferences.getString(USER);
    if (_user != null) {
      return Future.value(UserModel.fromJson(_user));
    } else {
      return Future.value(UserModel(birthdate: DateTime.now()));
    }
  }

  Future<String> get userId async {
    User _currentUser = getUser()!;
    String _id = _currentUser.uid;
    return _id;
  }

  Future<void> sendUsertoDatabase(UserModel user) async {
    await storeUser(user);
  }

  Future<void> storeUser(UserModel user) async {
    await sharedPreferences.setString(USER, user.toJson());
  }

  Future<void> updateUser(UserModel user) async {
    await storeUser(user);
  }
}