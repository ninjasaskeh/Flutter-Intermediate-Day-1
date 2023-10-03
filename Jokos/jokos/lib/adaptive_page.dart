import 'package:flutter/material.dart';
import 'package:jokos/detail_joke_page.dart';
import 'package:jokos/list_joke.dart';

import 'joke.dart';

class AdaptivePage extends StatefulWidget {
  const AdaptivePage({super.key});

  @override
  State<AdaptivePage> createState() => _AdaptivePageState();
}

class _AdaptivePageState extends State<AdaptivePage> {
  Joke? jokeChoose;
  @override
  Widget build(BuildContext context) {
    late Widget content;
    final screenSize = MediaQuery.of(context).size.shortestSide;
    final screenOrientation = MediaQuery.of(context).orientation;
    if (screenOrientation == Orientation.portrait && screenSize < 600) {
      // MODE TIDAK TABLET
      content = buildNoTablet();
    } else {
      // MODE TABLET
      content = buildTablet();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jokes App"),
        ),
        body: content,
    );
  }

  Widget buildNoTablet() {
    return ListJoke(chooseJokeCallback: (Joke joke) {
      // Berpindah Halaman
      final route = MaterialPageRoute(builder: (context) =>
      DetailJokePage(joke: joke,));
      Navigator.push(context, route);
      },);
  }

  Widget buildTablet() {
    return Row(
      children: [
        Flexible(child: Material(
          elevation: 16,
          child: ListJoke(
            jokeChoose: jokeChoose,
            chooseJokeCallback: (value) {
              setState(() {
                jokeChoose = value;
              });
            },
          ),
        )),
        Flexible(
          child: DetailJokePage(
            joke: jokeChoose,
          ),
        ),
      ],
    );
  }
}