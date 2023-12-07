import 'package:flutter/material.dart';

//Create a Custom button using GestureDetector, Material Button and show a snackbar.
class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    //Material Button
    return MaterialButton(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      elevation: 5.0,
      minWidth: 120.0,
      height: 50,
      color: const Color(0xFF801E48),
      child: const Text('Button',
          style: TextStyle(fontSize: 16.0, color: Colors.white)),
      onPressed: () {
        const shackBar = SnackBar(
          content: Text("Button Clicked"),
          backgroundColor: Colors.blue,
        );
        ScaffoldMessenger.of(context).showSnackBar(shackBar);
      },
    );
    // GestureDetector
/*
    return GestureDetector(
      onTap: () {
        const shackBar = SnackBar(
          content: Text("Button Clicked"),
          backgroundColor: Colors.blue,
        );
        ScaffoldMessenger.of(context).showSnackBar(shackBar);
      },
      child: Container(
        width: 120,
        height: 50,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(8.0)),
        child: const Text(
          "Button",
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.5,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal),
        ),
      ),
    );
*/
  }
}
