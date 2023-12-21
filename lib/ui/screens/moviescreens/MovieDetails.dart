import 'package:first_flutter_project/model/movies.dart';
import 'package:first_flutter_project/ui/screens/moviescreens/MovieDetailsCasts.dart';
import 'package:first_flutter_project/ui/screens/moviescreens/MovieDetailsExtraImages.dart';
import 'package:first_flutter_project/ui/screens/moviescreens/MovieDetailsHeaderWithImage.dart';
import 'package:first_flutter_project/ui/screens/moviescreens/MovieList.dart';
import 'package:flutter/material.dart';

import 'MovieDetailsThumbnail.dart';

class MovieDetails extends StatelessWidget {
  final Movies? moviesObj;

  const MovieDetails({super.key, this.moviesObj});

  @override
  Widget build(BuildContext context) {
    Movies movies = moviesObj!;
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
      body: ListView(
        children: [
          MovieDetailsThumbnail(thumbnail: moviesObj!.images[0]),
          MovieDetailsHeaderWithImage(movies: movies),
          MovieDetailsCasts(movies: movies),
          MovieDetailsExtraImages(imageList: movies.images,)
        ],
      ),
    );
  }
}
