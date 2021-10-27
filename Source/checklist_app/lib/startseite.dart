import 'package:checklist_app/haeckchen.dart';
import 'package:checklist_app/klassecheckliste.dart';
import 'package:checklist_app/neuechecklisteerstellen.dart';
import 'package:checklist_app/suchleiste.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Startseite extends StatefulWidget {
  late List<Checkliste> startseitenListen;
  Startseite(List<Checkliste> meineListen, {Key? key}) : super(key: key) {
    startseitenListen = meineListen;
  }

  @override
  _StartseiteState createState() => _StartseiteState();
}

class _StartseiteState extends State<Startseite> {
  @override
  Widget build(BuildContext context) {
    List<Container> containerliste = [];
    for (var liste in widget.startseitenListen) {
      var c = Container(
        margin: EdgeInsets.all(10),
        child: ElevatedButton(
            child: Container(child: Text(liste.titel)),
            style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 100)),
            //color: Colors.grey,
            //textColor: Colors.black,
            onPressed: () => checklisteanzeigen(liste)),
      );
      containerliste.add(c);
    }

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
              children: containerliste,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: neuechecklisteerstellen,
        tooltip: 'Neue Checkliste erstellen',
        backgroundColor: Colors.grey,
        child: Icon(Icons.add),
      ),
    );
  }

  void onPressed() {}

  void checklisteanzeigen(Checkliste liste) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Haeckchen(liste)));
  }

  void neuechecklisteerstellen() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => NeueChecklisteErstellen()));
  }
}
