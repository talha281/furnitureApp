import 'package:firebase_auth/firebase_auth.dart';
import 'package:furniture_app/data/models/user_model.dart';

abstract class IUserRepository {
  Future<UserModel>? getUser();
  User? getFirebaseUser();
  Future<UserModel> checkUserOnServer(String firebaseId);
  Future<String> get userId;
  Future<void> signOut();
  Future<UserModel> get user;
  Future<void> updateUser(UserModel user);
  Future<void> storeUser(UserModel user);
  Future<void> signInFirebase(AuthCredential credential);
  Future<void> sendOtp(
      String? phoneNumber,
      Duration timeOut,
      PhoneVerificationFailed phoneVerificationFailed,
      PhoneVerificationCompleted phoneVerificationCompleted,
      PhoneCodeSent phoneCodeSent,
      PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout);
  Future<UserCredential> verifyAndLogin(String verificationId, String? smsCode);

  //UserModel userInstance(UserModel userIns);
}
