import 'package:flutter/material.dart';
import 'package:jokos/joke.dart';

class ListJoke extends StatelessWidget {
  const ListJoke({super.key, this.jokeChoose, required this.chooseJokeCallback});
  final Joke? jokeChoose;
  final ValueChanged<Joke> chooseJokeCallback;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: jokesList.map((joke) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5)
          ),
          child: ListTile(
            title: Text(joke.setup),
            onTap: () => chooseJokeCallback(joke),
            selected: jokeChoose == joke,
            selectedColor: Colors.red,
          ),
        );
      } ).toList(),
    );
  }
}