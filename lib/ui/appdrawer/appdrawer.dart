import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/data/models/order_model.dart';
import 'package:furniture_app/data/models/user_model.dart';
import 'package:furniture_app/ui/contact_us/contact_us.dart';
import 'package:furniture_app/ui/login/login_page.dart';
import 'package:furniture_app/ui/orders/orders.dart';
import 'package:furniture_app/utils/address_manager.dart';
import 'package:furniture_app/utils/check_login.dart';
import 'package:furniture_app/utils/navigator_class.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Address/choose_address.dart';
import '../category_product.dart/productgrid.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  UserModel user = UserModel(username: '', email: '');

  _getLoggedInUser() async {
    UserModel _user = await checkLogin();
    setState(() {
      user = _user;
    });
  }

  void signOut(BuildContext context) async {
    FirebaseAuth.instance.signOut();

    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove('User');

    Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
            child: LoginPage(), type: PageTransitionType.rightToLeftWithFade),
        (Route<dynamic> route) => false);
  }

  @override
  void initState() {
    _getLoggedInUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(50))),
        width: MediaQuery.of(context).size.width * 0.70,
        child: Drawer(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(bottom: 1.5, right: 1.5),
                    height: 150,
                    child: Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Container(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //this container for the profile pic
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Theme.of(context).primaryColor,
                                    Theme.of(context).accentColor,
                                  ],
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.transparent,
                                child: Text(
                                  '${user.username!.substring(0, 1).toUpperCase()}${user.username!.split(' ').length > 1 ? user.username!.split(' ')[1].substring(0, 1).toUpperCase() : ''}',
                                  style: TextStyle(
                                      fontSize: 21.5, color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  user.username!,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              user.mobileNumber!,
                              style: TextStyle(
                                fontSize: 18,
                                color: kPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //here all the custom list started....
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      end: Alignment.topCenter,
                      begin: Alignment.bottomCenter,
                      colors: [
                        kPrimaryColor,
                        kPrimaryColor,
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(90),
                    ),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    children: [
                      DrawerList(
                        icon: FontAwesomeIcons.home,
                        labelText: 'Home',
                        fontSize: 16.0,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      DrawerList(
                        icon: FontAwesomeIcons.list,
                        labelText: 'Category',
                        fontSize: 16.0,
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: CategoriesScreen(),
                                  type:
                                      PageTransitionType.rightToLeftWithFade));
                        },
                      ),
                      DrawerList(
                        icon: FontAwesomeIcons.shoppingBag,
                        labelText: 'My Orders',
                        fontSize: 16.0,
                        onPressed: () async {
                          List<OrderModel> orders = [];

                          getOrdersList() async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            // prefs.remove('OrdersList');
                            List<OrderModel>? ordersList = [];
                            List<String>? getStoredList =
                                prefs.getStringList('OrdersList') ?? [];
                            if (getStoredList.isNotEmpty) {
                              getStoredList.forEach((element) {
                                ordersList.add(OrderModel.fromJson(element));
                              });
                              setState(() {
                                orders = ordersList;
                              });
                            }
                          }

                          await getOrdersList();

                          Navigation.pushNavigation(
                            context,
                            Orders(
                              orders: orders,
                            ),
                          );
                        },
                      ),
                      DrawerList(
                        icon: FontAwesomeIcons.addressCard,
                        labelText: 'Address',
                        fontSize: 16.0,
                        onPressed: () {
                          AddressManager().setAddress(0);
                          Navigation.pushNavigation(
                            context,
                            ChooseAddress(),
                          );
                        },
                      ),
                      DrawerList(
                        icon: FontAwesomeIcons.phone,
                        labelText: 'Contact Us',
                        fontSize: 16.0,
                        onPressed: () {
                          AddressManager().setAddress(0);
                          Navigation.pushNavigation(
                            context,
                            ContactUs(),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFFCBF1E),
                                borderRadius: BorderRadius.circular(10)),
                            height: 50,
                            child: FlatButton(
                                disabledTextColor: Colors.grey,
                                disabledColor: Theme.of(context).primaryColor,
                                child: Text(
                                  'Log Out',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0)),
                                onPressed: () async {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                            title: Text(
                                              'Are you sure?',
                                              style: TextStyle(
                                                  color: kPrimaryColor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18),
                                            ),
                                            content: Text(
                                              'You are about to log out of the app.',
                                              style: TextStyle(
                                                  color: kPrimaryColor
                                                      .withOpacity(0.7),
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 16),
                                            ),
                                            actions: [
                                              FlatButton(
                                                child: Text(
                                                  'OK',
                                                  style: TextStyle(
                                                      color: kPrimaryColor),
                                                ),
                                                onPressed: () {
                                                  signOut(context);
                                                },
                                              ),
                                              FlatButton(
                                                child: Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                      color: kPrimaryColor),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              )
                                            ],
                                          ));
                                  // signOut(context);
                                })),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//   void signOut(BuildContext context) async {
//     FirebaseAuth.instance.signOut();

//     SharedPreferences pref = await SharedPreferences.getInstance();
//     pref.remove('User');

//     Navigator.pushAndRemoveUntil(
//         context,
//         PageTransition(
//             child: Login(), type: PageTransitionType.rightToLeftWithFade),
//         (Route<dynamic> route) => false);
//   }
}

class DrawerList extends StatelessWidget {
  DrawerList({
    required this.icon,
    required this.labelText,
    required this.fontSize,
    required this.onPressed,
  });
  final IconData icon;
  final String labelText;
  final double fontSize;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8),
      child: ListTile(
        leading: CircleAvatar(
          radius: 22,
          backgroundColor: Colors.transparent,
          child: Icon(
            icon,
            color: Colors.white,
            size: 22,
          ),
        ),
        title: Text(
          labelText,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: fontSize,
            color: Colors.white,
          ),
        ),
        onTap: onPressed as void Function()?,
      ),
    );
  }
}
