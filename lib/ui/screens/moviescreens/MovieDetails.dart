import 'package:first_flutter_project/ui/screens/moviescreens/MovieList.dart';
import 'package:flutter/material.dart';

class MovieDetails extends StatelessWidget {
   final String? movieName;

  const MovieDetails({super.key,  this.movieName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey,
        leading: GestureDetector(
          onTap: () {
            debugPrint("Back");
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white, // Change the color of the arrow icon
          ),
        ),
        title: const Text(
          "Movie Details",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Center(child: Text(movieName??"Null"),),
    );
  }

}
