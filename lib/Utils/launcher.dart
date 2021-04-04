import 'dart:core';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

// final Uri _emailLaunchUri = Uri(
//   scheme: 'mailto',
//   path: 'smith@example.com',
//   queryParameters: {
//     'subject': 'Example Subject & Symbols are allowed!'
//   }
// );

// launch(_emailLaunchUri.toString());

void launchEmail({
   String? email,
}) async {
  String url() {
    if (Platform.isIOS) {
      return "mailto:$email?subject=News&body=New%20plugin";
    } else {
      return "mailto:$email?subject=News&body=New%20";
    }
  }

  if (await canLaunch(url())) {
    await launch(url());
  } else {
    throw 'Could not launch ${url()}';
  }
}
