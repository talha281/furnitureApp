import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/provider_class/provider_class.dart';
import 'package:furniture_app/screens/product/products_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => Cart(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Furniture app',
          theme: ThemeData(
            // We set Poppins as our default font
            primaryColor: kPrimaryColor,
            accentColor: kPrimaryColor,
            fontFamily: 'RobotoCondensed',
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: ProductsScreen(),
        ));
  }
}
