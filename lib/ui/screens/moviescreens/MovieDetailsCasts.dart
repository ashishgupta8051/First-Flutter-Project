import 'package:flutter/material.dart';

import '../../../model/movies.dart';

class MovieDetailsCasts extends StatelessWidget {
  const MovieDetailsCasts({super.key, required this.movies});

  final Movies movies;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 6, right: 6),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(padding: EdgeInsets.only(top: 4, bottom: 4), child: Divider(height: 0.5, color: Colors.grey)),
          Text.rich(TextSpan(
              style:  const TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w300),
              children: [
                const TextSpan(
                    text: "Cast: ",
                    style: TextStyle(color: Colors.grey)),
                TextSpan(text: movies.actors)

              ])),
          Padding(padding: const EdgeInsets.only(top: 1), child: Text.rich(TextSpan(
              style:  const TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w300),
              children: [
                const TextSpan(
                    text: "Director: ",
                    style: TextStyle(color: Colors.grey)),
                TextSpan(text: movies.director)

              ]))),
          Text.rich(TextSpan(
              style:  const TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w300),
              children: [
                const TextSpan(
                    text: "Awards: ",
                    style: TextStyle(color: Colors.grey)),
                TextSpan(text: movies.awards)

              ])),
          const Padding(padding: EdgeInsets.only(top: 4), child: Divider(height: 0.5, color: Colors.grey))
        ],
      ),
    );
  }
}
