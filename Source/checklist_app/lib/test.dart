import 'package:flutter/material.dart';
import 'package:localstore/localstore.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  _testState createState() => _testState();
}

class _testState extends State<test> {
  String id = "id";
  String path = "path";
  var text = "a";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: erstellen, child: Text("erstellen")),
          //ElevatedButton(onPressed: speichern, child: Text("speichern")), brauchen wir eigentlich nicht
          ElevatedButton(onPressed: anzeigen, child: Text("anzeigen")),
          ElevatedButton(onPressed: loeschen, child: Text("löschen")),
          Text(text)
        ],
      ),
    );
  }

  void erstellen() {
    final instance =
        Localstore.instance; //instace braucht man immer um damit zu arbeiten
    instance.collection(path).doc(id).set({
      "liste1": ["Hallo", "Hallo2"],
      "liste2": ["Hi", 'Hi2']
    }); //instance.collection(path).doc(id). benutzt man immer wenn man damit arbeitet
  }

  Future<void> anzeigen() async {
    final instance = Localstore.instance;
    var datei = await instance.collection(path).doc(id).get();
    text = ""; //ab hier ist es nacher anders wenn wir die Klassen haben
    if (datei != null) {
      for (var file in datei!["liste1"]) {
        setState(() {
          text += file + "\n";
        });
      }
    } else {
      setState(() {
        text = "";
      });
    }
  }

  void loeschen() {
    final instance = Localstore.instance;
    instance.collection(path).doc(id).delete();
  }
}
