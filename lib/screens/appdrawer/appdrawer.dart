import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/utils/navigator_class.dart';
import 'package:page_transition/page_transition.dart';

import '../Address/choose_address.dart';
import '../category_product.dart/productgrid.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String user = 'Talha Shaikh';
  String phoneNumber = '8149997223';
  // User user = User(username: '', email: '');

  // void launchCaller(int number) async {
  //   var url = 'tel:${number.toString()}';
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'could not place call';
  //   }
  // }

  // void launchUrl(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'could not open';
  //   }
  // }

  @override
  void initState() {
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
                                    kPrimaryColor,
                                    kPrimaryColor,
                                  ],
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.transparent,
                                child: Text(
                                  '${user.substring(0, 1).toUpperCase()}${user.split(' ').length > 1 ? user.split(' ')[1].substring(0, 1).toUpperCase() : ''}',
                                  style: TextStyle(fontSize: 21.5),
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
                                  user,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              phoneNumber,
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
                        icon: FontAwesomeIcons.shoppingBag,
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
                        onPressed: () {
                          Navigation.pushNavigation(
                            context,
                            widget,
                          );
                        },
                      ),
                      DrawerList(
                        icon: FontAwesomeIcons.addressCard,
                        labelText: 'Address',
                        fontSize: 16.0,
                        onPressed: () {
                          Navigation.pushNavigation(
                            context,
                            ChooseAddress(),
                          );
                        },
                      ),
                      DrawerList(
                        icon: FontAwesomeIcons.userShield,
                        labelText: 'Privacy Policy',
                        fontSize: 16.0,
                        onPressed: () {
                          // launchUrl(privacy);
                        },
                      ),
                      DrawerList(
                        icon: FontAwesomeIcons.list,
                        labelText: 'Terms & Conditions',
                        fontSize: 16.0,
                        onPressed: () {
                          //launchUrl(terms);
                        },
                      ),
                      DrawerList(
                        icon: FontAwesomeIcons.comments,
                        labelText: 'FAQ\'s',
                        fontSize: 16.0,
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     PageTransition(
                          //         child: Faq(),
                          //         type: PageTransitionType.rightToLeftWithFade));
                        },
                      ),
                    ],
                  ),
                ),
              ),

              // Container(
              //     padding: EdgeInsets.all(25),
              //     child: button(
              //         title: 'LOGOUT',
              //         textStyle: TextStyle(
              //             color: theme.textWhite,
              //             fontSize: 16,
              //             fontWeight: FontWeight.normal),
              //         callback: () async {
              //           showDialog(
              //               context: context,
              //               child: AlertDialog(
              //                 title: Text(
              //                   'Are you sure?',
              //                   style: TextStyle(
              //                       color: theme.primaryDark,
              //                       fontWeight: FontWeight.w500,
              //                       fontSize: 18),
              //                 ),
              //                 content: Text(
              //                   'You are about to log out of the app.',
              //                   style: TextStyle(
              //                       color: theme.textMedium,
              //                       fontWeight: FontWeight.normal,
              //                       fontSize: 16),
              //                 ),
              //                 actions: [
              //                   FlatButton(
              //                     child: Text('OK'),
              //                     onPressed: () {
              //                       signOut(context);
              //                     },
              //                   ),
              //                   FlatButton(
              //                     child: Text('Cancel'),
              //                     onPressed: () {
              //                       Navigator.of(context).pop();
              //                     },
              //                   )
              //                 ],
              //               ));
              //           // signOut(context);
              //         })),
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
