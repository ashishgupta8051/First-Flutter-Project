import 'package:flutter/material.dart';

//Create a Custom button using GestureDetector, Material Button and show a snackbar.
class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    //Material Button
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Custom Button",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 20)),
              ElevatedButton(
                onPressed: () => _onButtonPressed("Elevated Button"),
                child: const Text('Elevated Button'),
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              TextButton(
                onPressed: () => _onButtonPressed("Text Button"),
                child: const Text('Text Button'),
              ),

              const Padding(padding: EdgeInsets.only(top: 20)),
              OutlinedButton(
                onPressed: () => _onButtonPressed("Outlined Button"),
                child: const Text('Outlined Button'),
              ),

              const Padding(padding: EdgeInsets.only(top: 20)),
              MaterialButton(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                elevation: 5.0,
                minWidth: 120.0,
                height: 50,
                color: const Color(0xFF801E48),
                child: const Text('Button',
                    style: TextStyle(fontSize: 16.0, color: Colors.white)),
                onPressed: () {
                  _onButtonPressed("Material Button");
                },
              ),

              const Padding(padding: EdgeInsets.only(top: 20)),
              ElevatedButton(
                onPressed: _onButtonPressed("Elevated Button with Text and Image"),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.add_a_photo,  // Replace with your image
                      size: 20,
                    ),
                    Padding(padding: EdgeInsets.only(right: 10)),
                    Text(
                      'Click Me',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );

    // Gesture Detector
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

  _onButtonPressed(String value) {
    print("Button Name: $value");
  }

}
