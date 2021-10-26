import 'package:flutter/material.dart';
import 'package:localstore/localstore.dart';

class LokalesSpeichern extends StatefulWidget {
  @override
  _LokalesSpeichernState createState() => _LokalesSpeichernState();
}

class _LokalesSpeichernState extends State<LokalesSpeichern> {
  var text = "";

  String id = 'AlleListenID';
  String path = 'AlleListenPath';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              child: Text("Neue Datei Erstellen"),
              onPressed: doSomething,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
                onPressed: deleteFile, child: Text("Delete me :c")),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              child: Text("Alle Werte aus Liste auslesen"),
              onPressed: doSomethingElse,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(text),
          ),
        ],
      ),
    );
  }

  void deleteFile() {
    final instance = Localstore.instance;
    instance.collection(path).doc(id).delete();
  }

  void doSomething() {
    final instance = Localstore.instance;
    instance.collection(path).doc(id).set({
      'liste1': [
        ['a', true],
        ['b', false]
      ],
      'liste2': [
        ['c', false],
        ['d', false]
      ]
    });
  }

  Future<void> doSomethingElse() async {
    final instance = Localstore.instance;
    var datei = await instance.collection(path).doc(id).get();
    text = "";
    for (var file in datei!['liste2']) {
      setState(() {
        text += "Eintrag: \nName: " +
            file[0].toString() +
            ", Wert: " +
            file[1].toString() +
            "\n";
      });
    }
  }
}
