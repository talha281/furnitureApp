import 'package:flutter/material.dart';

class Circular extends StatelessWidget {
  final Color color;

  const Circular({required this.color});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        padding: EdgeInsets.all(20),
        child: CircularProgressIndicator(
          backgroundColor: Colors.transparent,
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
      ),
    );
  }
}
