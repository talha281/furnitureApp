import 'package:flutter/material.dart';
import 'package:furniture_app/ui/dashboard/dashboard.dart';
import 'package:furniture_app/utils/check_login.dart';

import 'data/models/user_model.dart';
import 'ui/login/login_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoggedIn = false;
  late UserModel currentUser;
  @override
  void initState() {
    super.initState();
  }

  _getLoggedInUser() async {
    UserModel _user = await checkLogin();

    if (_user.username != null) {
      setState(() {
        isLoggedIn = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    
    _getLoggedInUser();
    return (isLoggedIn) ? Dashboard() : LoginPage();
  }
}
