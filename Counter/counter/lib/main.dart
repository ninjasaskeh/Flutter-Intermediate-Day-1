import 'package:counter/number_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NumberProvider(),
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Consumer<NumberProvider>(
                builder: (context, numberProvider, _) {
                  return Text(
                    numberProvider.number.toString(),
                  );
                },
              )),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Consumer<NumberProvider>(
                  builder: (context, numberProvider, _) {
                    return Text(
                      numberProvider.number.toString(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  },
                ),
              ],
            ),
          ),
          // floatingActionButton:
          //     Consumer<NumberProvider>(builder: (context, numberProvider, _) {
          //   return FloatingActionButton(
          //     onPressed: () {
          //       numberProvider.number++;
          //     },
          //     tooltip: 'Increment',
          //     child: const Icon(Icons.add),
          //   );
          // })),
          floatingActionButton: FloatingButton(),
    ));
  }
}

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Provider.of<NumberProvider>(context, listen: false).number++;
      },
      tooltip: "Increment",
      child: const Icon(Icons.add),
      );
  }
}
