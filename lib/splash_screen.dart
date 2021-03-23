import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(child: Text('Furniture App')
          // Logo(
          //   width: width * .7,
          // ),
          ),
    );
  }
}
