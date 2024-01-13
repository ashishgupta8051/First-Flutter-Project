import 'package:flutter/material.dart';
import '../../../model/jokes_data.dart';

class JokeListing extends StatelessWidget {
  final Joke? jokeSelected;
  final ValueChanged<Joke> jokeSelectorCallback;

  const JokeListing({super.key, this.jokeSelected, required this.jokeSelectorCallback});


  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        getList()
      ],
    );
  }

 getList() {
    jokesList.map((joke) => {
      Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(4.5)
        ),
        child: ListTile(
          title: Text(joke.setup),
          onTap: () => jokeSelectorCallback(joke),
          selected: jokeSelected == joke,
        ),
      )
    }).toList();
  }

}


