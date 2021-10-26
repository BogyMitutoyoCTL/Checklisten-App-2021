import 'package:checklist_app/startseite.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BogyChecklistApp());
}

class BogyChecklistApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.grey,
          canvasColor: Color.fromARGB(254, 190, 195, 200)),
      home: Startseite(),
    );
  }
}
