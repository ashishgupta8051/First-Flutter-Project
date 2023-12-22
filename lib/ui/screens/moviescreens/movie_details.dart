import 'package:first_flutter_project/model/movies_data.dart';
import 'package:first_flutter_project/ui/screens/moviescreens/movie_details_cast.dart';
import 'package:first_flutter_project/ui/screens/moviescreens/movie_details_extra_image.dart';
import 'package:first_flutter_project/ui/screens/moviescreens/movie_details_header_with_image.dart';
import 'package:first_flutter_project/ui/screens/moviescreens/movie_list.dart';
import 'package:flutter/material.dart';

import 'movie_details_thumbnail.dart';

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
