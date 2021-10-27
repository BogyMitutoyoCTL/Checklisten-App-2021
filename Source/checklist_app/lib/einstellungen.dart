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
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  child: ElevatedButton(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('Darkmode'),
                        width: 550,
                        height: 120,
                      ),
                      //color: Colors.grey,
                      //textColor: Colors.black,
                      onPressed: () {}),
                ),
              ],
            )
          ]),
        ));
  }
}
