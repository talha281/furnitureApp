import 'package:furniture_app/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<UserModel> checkLogin() async {
  var prefs = await SharedPreferences.getInstance();
  String? _user = prefs.getString('User');
  if (_user != null) {
    // print(_user);
    return UserModel.fromJson(_user);
  } else {
    return UserModel();
  }
}
