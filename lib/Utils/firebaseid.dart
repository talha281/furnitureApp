import 'package:firebase_auth/firebase_auth.dart';

Future<String> getUserId() async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? _currentUser = _auth.currentUser;
  String _id = _currentUser!.uid;
  return _id;
}