import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'number_input.dart';

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Image.asset(
                        'assets/images/logo.png',
                        // fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 50),
                    NumberInput(),
                    Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.center,
                        child: Text('We will send you an otp',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400)),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * .055),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  SnackBar buildSnackBar(double width, String message, BuildContext context) {
    return SnackBar(
      duration: Duration(seconds: 10),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.error,
            color: Colors.red,
          ),
          SizedBox(width: 5),
          Container(width: width * 0.62, child: Text(message)),
        ],
      ),
      action: SnackBarAction(
        label: 'CLOSE',
        textColor: Colors.white,
        onPressed: () {
          close(context);
        },
      ),
      backgroundColor: Colors.black,
    );
  }

  void close(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }
}

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
        child: CircularProgressIndicator(),
      );
}
