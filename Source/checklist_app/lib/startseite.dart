import 'package:checklist_app/suchleiste.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Startseite extends StatefulWidget {
  Startseite({Key? key}) : super(key: key);

  @override
  _StartseiteState createState() => _StartseiteState();
}

class _StartseiteState extends State<Startseite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deine Checklisten"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Suchleise(),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                      child: Container(child: Text('Checkliste 1')),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 100)),
                      //color: Colors.grey,
                      //textColor: Colors.black,
                      onPressed: () {}),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                      child: Container(child: Text('Checkliste 2')),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 100)),
                      //color: Colors.grey,
                      //textColor: Colors.black,
                      onPressed: () {}),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                      child: Container(child: Text('Checkliste 3')),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 100)),
                      //color: Colors.grey,
                      //textColor: Colors.black,
                      onPressed: () {}),
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressed,
        tooltip: 'Neue Checkliste erstellen',
        backgroundColor: Colors.grey,
        child: Icon(Icons.add),
      ),
    );
  }

  void onPressed() {}
}
