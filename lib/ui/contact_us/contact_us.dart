import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/utils/contact_container.dart';
import 'package:furniture_app/utils/launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  String contactNumber = '9119596974';
  String emailAddress = 'sahil@gmail.com';
  String contactMessage = 'Contact us From this number.';
  String emailMessage = 'Mail us on.';
  //bool showText = false;
 // String text = '';

  void launchCaller(String number) async {
    var url = 'tel:$number';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'could not place call';
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact Us')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ContactScrContainer(
                height: 250,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                icon: FontAwesomeIcons.phone,
                icontext: Text(
                  'Call Us',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                ),
                messageText: Text(
                  contactMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.normal),
                ),
                callback: () {
                  launchCaller(contactNumber);
                },
                contactThrough: Text(
                  contactNumber,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ContactScrContainer(
                width: double.infinity,
                height: 250,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                icon: Icons.mail,
                icontext: Text(
                  'Email Us ',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                ),
                messageText: Text(
                  emailMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.normal),
                ),
                callback: () {
                  launchEmail(email: emailAddress);
                },
                contactThrough: Text(
                  emailAddress,
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
