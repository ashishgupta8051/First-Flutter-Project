import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.orange,
      child: Center(
        child: Text("Hello Ashish Gupta",
          textDirection: TextDirection.ltr,
          style: TextStyle(fontSize: 18,
              fontStyle: FontStyle.italic,
              color: Colors.white),

        ),
      ),
    );
  }
}


