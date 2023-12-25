import 'package:flutter/material.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("Floating Button Tapped");
        },
        shape: const CircleBorder(),
        backgroundColor: Colors.yellow,
        child: const Icon(Icons.call),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.email), label: "Email"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Message"),
          BottomNavigationBarItem(icon: Icon(Icons.delete), label: "Delete")
        ],
        onTap: (int index) => {
          if (index == 0)
            {debugPrint("Email")}
          else if (index == 1)
            {debugPrint("Message")}
          else if (index == 2)
            {debugPrint("Delete")}
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}
