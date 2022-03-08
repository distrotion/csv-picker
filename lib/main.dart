import 'dart:html';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'CsvpickerBody.dart';
import 'datadummy.dart';

// // import 'csv_to_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CsvPicker(),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
