import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_app/constants/paddings.dart';
import 'package:furniture_app/data/enums/gender_enum.dart';
import 'package:furniture_app/data/enums/status_enum.dart';
import 'package:furniture_app/data/models/user_model.dart';
import 'package:furniture_app/global/auth/bloc/authentication_bloc.dart';
import 'package:furniture_app/global/user/bloc/user_bloc.dart';
import 'package:furniture_app/register_user/widgets/birthdate_widget.dart';
import 'package:furniture_app/register_user/widgets/radio_widget.dart';
import 'package:furniture_app/routers.dart';
import 'package:furniture_app/utils/buttons.dart';
import 'package:furniture_app/utils/date_format.dart';
import 'package:furniture_app/utils/textfields_Utils.dart';
import 'widgets/register_fields.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  Gender _gender = Gender.male;
  MaritalStatus _maritalStatus = MaritalStatus.single;

  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDatePickerMode: DatePickerMode.day,
      currentDate: DateTime.now(),
      initialDate: _selectedDate,
      firstDate: DateTime(1960, 1, 1),
      lastDate: DateTime(2200, 12, 31),
    );
    setState(() {
      _selectedDate = picked!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Register User',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          elevation: 0,
        ),
        body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
          if (state is RegisteredUserState) {
            _nameTextController.text = state.user.username!;
            _phoneController.text = state.user.mobileNumber!;
            _emailController.text = state.user.email!;
          }

          return Container(
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
                              constraints: BoxConstraints(
                                  maxHeight: 150.0, maxWidth: 250),
                              child: RegisterTextField(
                                _nameTextController,
                                'Enter Name',
                                TextAlign.start,
                                TextInputType.name,
                                onEditingComplete: () {},
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
                    fieldName: 'RegisterUserConstString.mobileNumber',
                    hintText: 'RegisterUserConstString.phoneNumber',
                    inputType: TextInputType.phone,
                  ),
                  Divider(
                    color: Theme.of(context).primaryColor,
                  ),
                  RadioWidget<Gender>(
                    values: Gender.values,
                    groupValue: _gender,
                    title: 'RegisterUserConstString.gender',
                    onChanged: (Gender? value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                  Divider(
                    color: Theme.of(context).primaryColor,
                  ),
                  BirthDateWidget(
                    fieldName: 'RegisterUserConstString.birthday',
                    onTap: () {
                      _selectDate(context);
                    },
                    birthDaytext: formatAsDDMMYYYY(_selectedDate),
                  ),
                  Divider(
                    color: Theme.of(context).primaryColor,
                  ),
                  FittedBox(
                    fit: BoxFit.cover,
                    child: RadioWidget<MaritalStatus>(
                      values: MaritalStatus.values,
                      groupValue: _maritalStatus,
                      title: 'RegisterUserConstString.maritalStatus',
                      onChanged: (MaritalStatus? value) {
                        setState(() {
                          _maritalStatus = value!;
                        });
                      },
                    ),
                  ),
                  Divider(
                    color: Theme.of(context).primaryColor,
                  ),
                  EditUsersWidget(
                    controller: _emailController,
                    fieldName:' RegisterUserConstString.emailId',
                    hintText: 'RegisterUserConstString.enterEmail',
                    inputType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  submitButton(() async {
                    BlocProvider.of<UserBloc>(context)
                        .add(UpdateUserEvent(UserModel(
                      birthdate: _selectedDate,
                      email: _emailController.text,
                      mobileNumber: _phoneController.text,
                      gender: _gender,
                      username: _nameTextController.text,
                      status: _maritalStatus,
                    )));

                    BlocProvider.of<AuthenticationBloc>(context)
                        .add(AppStarted());

                    RouteNavigation.routeKey.currentState!
                        .popUntil((route) => route.isFirst);
                  }, context, 'save'),
                  SizedBox(height: 20)
                ],
              ),
            ),
          );
        }));
  }
}

// (state is RegisteredUserState)
//                             ? state.userInstance.gender
//                             : (state is ANewUserState)
//                                 ? state.userInstance.gender
//                                 : genderGroupValue,
