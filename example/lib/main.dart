import 'package:daily_extensions/daily_extensions.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'Daily Extensions Demo',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const _demoNumber = 3.0;
  static const _demoList = [1, 3, 2, 3, 4, 3, 3];
  static const _demoEmail = 'info@ihorbokov.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'What is today\'s date? - ${DateTimeX.now.toDate()}.',
            textAlign: TextAlign.center,
          ),
          Text(
            'What is the actual value of $_demoNumber? - ${_demoNumber.toActual()}.',
            textAlign: TextAlign.center,
          ),
          Text(
            'How many times number 3 appears in\n$_demoList? - ${_demoList.count((item) => item == 3)}.',
            textAlign: TextAlign.center,
          ),
          Text(
            'Is $_demoEmail an email? - ${_demoEmail.isEmail ? 'Yes' : 'No'}.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
