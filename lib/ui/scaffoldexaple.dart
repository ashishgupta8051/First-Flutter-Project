import 'package:flutter/material.dart';
import 'custombutton.dart';

class ScaffoldExample extends StatelessWidget {
  const ScaffoldExample({super.key});

  @override
  Widget build(BuildContext context) {
    tapButton() {
      var clickedValue = "Taped Delete Button";
      debugPrint(clickedValue);
      var shackBar = SnackBar(
        content: Text(clickedValue),
        backgroundColor: Colors.blue,
      );
      ScaffoldMessenger.of(context).showSnackBar(shackBar);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent.shade400,
        title: const Text(
          "Scaffold Example",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {
                var clickedValue = "Email Tapped";
                debugPrint(clickedValue);
                var shackBar = SnackBar(
                  content: Text(clickedValue),
                  backgroundColor: Colors.blue,
                );
                ScaffoldMessenger.of(context).showSnackBar(shackBar);
              },
              icon: const Icon(Icons.email)),
          IconButton(
            onPressed: tapButton,
            icon: const Icon(Icons.delete),
            color: Colors.white,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        // margin: const EdgeInsets.symmetric(horizontal: 10),
        // margin: const EdgeInsets.all(10),
        margin: const EdgeInsets.fromLTRB(10,10,10,10),
        color: Colors.blue,
        alignment: Alignment.center,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomButton()
          ],
        ),
      ),
    );
  }
}
