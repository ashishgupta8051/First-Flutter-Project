import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.white,
      child: Center(
        child: Text(
          "Hello Ashish Gupta",
          textDirection: TextDirection.ltr,
          style: TextStyle(
              fontSize: 18, fontStyle: FontStyle.italic, color: Colors.black),
        ),
      ),
    );
  }
}


