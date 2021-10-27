import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Einstellungen extends StatefulWidget {
  const Einstellungen({Key? key}) : super(key: key);

  @override
  _EinstellungenState createState() => _EinstellungenState();
}

class _EinstellungenState extends State<Einstellungen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Einstellungen"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Column(children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: ElevatedButton(
                  child: Container(child: Text('Darkmode')),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 100)),
                  //color: Colors.grey,
                  //textColor: Colors.black,
                  onPressed: () {}),
            )
          ]),
          Column(children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: ElevatedButton(
                  child: Container(child: Text('Sprache ändern')),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 100)),
                  //color: Colors.grey,
                  //textColor: Colors.black,
                  onPressed: () {}),
            ),
          ]),
          Column(children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: ElevatedButton(
                  child: Container(child: Text('Fehler melden')),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 100)),
                  //color: Colors.grey,
                  //textColor: Colors.black,
                  onPressed: () {}),
            ),
          ]),
        ])));
  }
}
