import 'dart:html';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
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

DateTime selectedDate = DateTime.now();

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (picked != null && picked != selectedDate)
        setState(() {
          selectedDate = picked;
          // print(selectedDate);
        });
    }

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Flutter CSV Upload"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  InkWell(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: SizedBox(
                          height: 50,
                          width: 100,
                          child: Center(
                              child: Text(
                                  "${selectedDate.toLocal()}".split(' ')[0])))),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.green,
                height: 30,
                child: TextButton(
                    child: const Text(
                      "Export to CSV",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      setState(() {
                        final List data = datatest;
                        ExpCSV(data);
                      });
                    }),
              ),
            ),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

ExpCSV(List data) {
  List<List<dynamic>> rows = [];

  for (int i = -1; i < data.length; i++) {
    List<dynamic> row = [];
    if (i == -1) {
      row.add('date');
      row.add('Condition No');
      row.add('G');
      row.add('NG');
    } else {
      row.add(data[i]['date']);
      row.add(data[i]['Condition No']);
      row.add(data[i]['G']);
      row.add(data[i]['NG']);
    }

    rows.add(row);
  }
  String csv = const ListToCsvConverter().convert(rows);
  AnchorElement(href: "data:text/plain;charset=utf-8,$csv")
    ..setAttribute("download", "data.csv")
    ..click();
}

class ExportCsv {
  final List data;
  ExportCsv({required this.data});

  List<List<dynamic>> rows = <List<dynamic>>[];
  downloadData() {
    for (int i = 0; i < data.length; i++) {
      List<dynamic> row = [];
      row.add(data[i].userName);
      row.add(data[i].userLastName);
      row.add(data[i].userEmail);
      rows.add(row);
    }

    String csv = const ListToCsvConverter().convert(rows);
    AnchorElement(href: "data:text/plain;charset=utf-8,$csv")
      ..setAttribute("download", "data.csv")
      ..click();
  }
}

// List dda = [
//   {"userName": "test", "userLastName": "test2", "userEmail": "test3"},
//   {"userName": "qtest", "userLastName": "qtest2", "userEmail": "qtest3"}
// ];






