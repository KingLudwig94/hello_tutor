// Build an app that generates a random number between 0 and 1000 
// when a button is tapped and displays for example: The number 3 is odd.
// The color of the text must change according to the number: red if is odd, green if is even.
// Also change the widget of the FAB between a text and an add icon (text if odd, icon if even)

import 'package:flutter/material.dart';
import 'dart:math';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Odd or Even'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int _number;
  late bool isOdd;

  Random r = Random();
  @override
  void initState() {
    _number = r.nextInt(1000);
    isOdd = _number.isOdd;
    super.initState();
  }

  void _generateNew() {
    setState(() {
      _number = r.nextInt(1000);
      isOdd = _number % 2 == 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    late Text text;
    if(isOdd){
      text = Text(
          'The number $_number is odd',
          style: TextStyle(color: isOdd ? Colors.red : Colors.green),
        );
    }else{
      text = Text(
          'The number $_number is even',
          style: TextStyle(color: isOdd ? Colors.red : Colors.green),
        );

    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(
          'The number $_number is ${isOdd ? 'odd' : 'even'}',
          style: TextStyle(color: isOdd ? Colors.red : Colors.green),
        ),
        // alternative solution: use the text widget we have initialized above
        // text
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _generateNew,
        tooltip: 'Increment',
        isExtended: true,
        child: isOdd ? const Text('add') : const Icon(Icons.add),
      ),
    );
  }
}
