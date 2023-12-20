import 'dart:convert';

Movies moviesFromJson(String str) => Movies.fromJson(json.decode(str));

/*
String moviesToJson(Movies data) => json.encode(data.toJson());
*/

class Movies {
  String released;
  String metascore;
  String imdbId;
  String plot;
  List<String> images;
  String director;
  String title;
  String actors;
  String imdbRating;
  String imdbVotes;
  String response;
  String runtime;
  String type;
  String awards;
  String year;
  String language;
  String rated;
  String poster;
  String country;
  String genre;
  String writer;

  Movies({
    required this.released,
    required this.metascore,
    required this.imdbId,
    required this.plot,
    required this.images,
    required this.director,
    required this.title,
    required this.actors,
    required this.imdbRating,
    required this.imdbVotes,
    required this.response,
    required this.runtime,
    required this.type,
    required this.awards,
    required this.year,
    required this.language,
    required this.rated,
    required this.poster,
    required this.country,
    required this.genre,
    required this.writer,
  });

  factory Movies.fromJson(Map<dynamic, dynamic> json) => Movies(
        released: json["Released"],
        metascore: json["Metascore"],
        imdbId: json["imdbID"],
        plot: json["Plot"],
        images: List<String>.from(json["Images"].map((x) => x)),
        director: json["Director"],
        title: json["Title"],
        actors: json["Actors"],
        imdbRating: json["imdbRating"],
        imdbVotes: json["imdbVotes"],
        response: json["Response"],
        runtime: json["Runtime"],
        type: json["Type"],
        awards: json["Awards"],
        year: json["Year"],
        language: json["Language"],
        rated: json["Rated"],
        poster: json["Poster"],
        country: json["Country"],
        genre: json["Genre"],
        writer: json["Writer"],
      );

/*
  Map<dynamic, dynamic> toJson() => {
        "Released": released,
        "Metascore": metascore,
        "imdbID": imdbId,
        "Plot": plot,
        "Images": List<dynamic>.from(images.map((x) => x)),
        "Director": director,
        "Title": title,
        "Actors": actors,
        "imdbRating": imdbRating,
        "imdbVotes": imdbVotes,
        "Response": response,
        "Runtime": runtime,
        "Type": type,
        "Awards": awards,
        "Year": year,
        "Language": language,
        "Rated": rated,
        "Poster": poster,
        "Country": country,
        "Genre": genre,
        "Writer": writer,
      };
*/
}
