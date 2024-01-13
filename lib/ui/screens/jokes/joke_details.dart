import 'package:flutter/material.dart';

import '../../../model/jokes_data.dart';

class JokeDetails extends StatelessWidget {
  final bool isInTabletLayout;
  final Joke joke;


  JokeDetails(this.isInTabletLayout, this.joke, {super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(joke?.setup ?? "No joke selected", style: textTheme.headline1,),
        )
      ],
    );

    if(isInTabletLayout){
      return Center(child: content);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(joke?.type ?? "No joke"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: content,
      ),
    );
  }
}
