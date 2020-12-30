import 'package:flutter/material.dart';

class Navigation{

static pushNavigation(BuildContext context,Widget widget){
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
}


}