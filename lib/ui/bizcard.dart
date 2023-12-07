import 'package:flutter/material.dart';

class BizCard extends StatelessWidget {
  const BizCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text("Biz Card"),

      ),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
