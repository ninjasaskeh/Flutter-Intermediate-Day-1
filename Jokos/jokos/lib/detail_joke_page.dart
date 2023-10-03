import 'package:flutter/material.dart';

import 'joke.dart';

class DetailJokePage extends StatelessWidget {
  final Joke? joke;
  const DetailJokePage({super.key, this.joke});


  @override
  Widget build(BuildContext context) {
    Widget content() {
      return Column(
        children: [
          Padding(
          padding: const EdgeInsets.all(8),
          child: Text(joke?.setup ?? 'Joke belum dipilih'),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(joke?.punchline ?? "Tidak ada punchline"),)
        ],
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(joke?.type ?? "Joke Tipe"),
      ),
      body: Center(child: content()),
      backgroundColor: Colors.orange,
    );
  }
}