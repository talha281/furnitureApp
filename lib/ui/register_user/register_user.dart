import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_app/constants/paddings.dart';
import 'package:furniture_app/data/models/user_model.dart';
import 'package:furniture_app/data/repository/user/i_user_repository.dart';
import 'package:furniture_app/global/widgets/circular_progress_indicator.dart';
import 'package:furniture_app/routers.dart';
import 'package:furniture_app/ui/dashboard/dashboard.dart';
import 'package:furniture_app/utils/buttons.dart';
import 'package:furniture_app/utils/textfields_Utils.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'widgets/register_fields.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool canPress = false;
  late IUserRepository userRepository;
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  Future<void> storeUser(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('inside the store user');
    await prefs.setString('User', user.toJson());
    Navigator.pushReplacement(
        context,
        PageTransition(
            child: Dashboard(), type: PageTransitionType.rightToLeftWithFade));
  }

  validateEntries() {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);
    bool val = regExp.hasMatch(_emailController.text);
    var canHit = _nameTextController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        val;

    if (canHit) {
      setState(() {
        canPress = true;
      });
    } else {
      setState(() {
        canPress = false;
      });
    }
  }

  @override
  void initState() {
    _nameTextController.addListener(() {
      validateEntries();
    });
    _phoneController.addListener(() {
      validateEntries();
    });
    _emailController.addListener(() {
      validateEntries();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Register User',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: Container(
        padding: ConstPadding.symmH10,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: ConstPadding.l12t25,
                        child: Text('Name',
                            style: TextStyle(fontWeight: FontWeight.w400)),
                      ),
                      Container(
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints(maxHeight: 150.0, maxWidth: 250),
                          child: RegisterTextField(
                            _nameTextController,
                            'Enter Name',
                            TextAlign.start,
                            TextInputType.name,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                color: Theme.of(context).primaryColor,
              ),
              EditUsersWidget(
                controller: _phoneController,
                fieldName: 'Phone Number',
                hintText: 'Phone Number',
                inputType: TextInputType.phone,
              ),
              Divider(
                color: Theme.of(context).primaryColor,
              ),
              EditUsersWidget(
                controller: _emailController,
                fieldName: 'Email',
                hintText: 'Enter Email',
                inputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 15,
              ),
              submitButton(() async {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return Container(
                        color: Colors.white10,
                        height: 100,
                        width: 100,
                        child: Center(
                          child: Circular(
                            color: Color(0xFFFCBF1E),
                          ),
                        ),
                      );
                    });
                UserModel user = UserModel(
                  email: _emailController.text,
                  mobileNumber: _phoneController.text,
                  username: _nameTextController.text,
                );
                await storeUser(user);
              }, context, 'save'),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}

// (state is RegisteredUserState)
//                             ? state.userInstance.gender
//                             : (state is ANewUserState)
//                                 ? state.userInstance.gender
//                                 : genderGroupValue,
