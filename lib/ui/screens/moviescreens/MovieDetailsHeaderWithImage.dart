import 'package:first_flutter_project/model/movies.dart';
import 'package:flutter/material.dart';

class MovieDetailsHeaderWithImage extends StatelessWidget {
  const MovieDetailsHeaderWithImage({super.key, required this.movies});

  final Movies movies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 150,
        child: Padding(
            padding:
                const EdgeInsets.only(left: 6, top: 0, bottom: 6, right: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  margin: const EdgeInsets.only(right: 8),
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.blueGrey, width: 1.2),
                      image: DecorationImage(
                          image: NetworkImage(movies.images[0]),
                          fit: BoxFit.cover)),
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movies.title,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          "${movies.year} . ${movies.genre}".toUpperCase(),
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.blue),
                        ))
                      ],
                    ),
                    Text.rich(TextSpan(
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w300),
                        children: [
                          TextSpan(text: movies.plot),
                          const TextSpan(
                              text: "More...",
                              style: TextStyle(color: Colors.blue))
                        ]))
                  ],
                ))
              ],
            )));
  }
}
