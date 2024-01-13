import 'package:first_flutter_project/model/jokes_data.dart';
import 'package:flutter/material.dart';

import 'joke_details.dart';
import 'jokes_listing.dart';

class MasterDetailScreen extends StatefulWidget {
  const MasterDetailScreen({super.key});

  @override
  State<MasterDetailScreen> createState() => _MasterDetailScreenState();
}

class _MasterDetailScreenState extends State<MasterDetailScreen> {
  @override
  Widget build(BuildContext context) {
    const int tabletBreakpoint = 600;
    late Joke selectedJoke;

    Widget buildMobileLayout() {
      return JokeListing(jokeSelectorCallback: (jokeSelected){
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
              return JokeDetails(false, jokeSelected);
            }));
      });
    }

    Widget buildTabletLayout() {
      return Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Material(
              elevation: 13.0 ,
              child: JokeListing(jokeSelectorCallback: (jokeSelected){
                setState(() {
                  selectedJoke = jokeSelected;
                });
              }, jokeSelected: selectedJoke),

            ),
          ),
          Flexible(
            flex: 3,
            child: JokeDetails(true, selectedJoke)
          )
        ],
      );
    }


    Widget content;
    var shortestSide = MediaQuery
        .of(context)
        .size
        .shortestSide;
    var orientation = MediaQuery
        .of(context)
        .orientation;

    if (orientation == Orientation.portrait &&
        shortestSide < tabletBreakpoint) {
      //Mobile
      content = buildMobileLayout();
    } else {
      //tablet
      content = buildTabletLayout();
    }

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
          "Jokes",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: content
    );
  }
}
