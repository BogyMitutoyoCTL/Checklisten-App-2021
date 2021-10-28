import 'package:checklist_app/haeckchen.dart';
import 'package:checklist_app/klassecheckliste.dart';
import 'package:checklist_app/lokalesspeichern.dart';
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
      var icon = Icons.assignment_late_outlined;
      var marked = true;
      for (var eintrag in liste.eintraege) {
        marked = marked && eintrag.erledigt;
      }
      if (marked == true) {
        icon = Icons.assignment_turned_in_outlined;
      }
      var c = Container(
        margin: EdgeInsets.all(10),
        child: GestureDetector(
          onTapDown: (TapDownDetails details) =>
              _showPopupMenu(details.globalPosition),
          child: ElevatedButton(
              child: Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Text(liste.titel), Icon(icon)],
              )),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 100)),
              //color: Colors.grey,
              //textColor: Colors.black,
              onPressed: () => showChecklist(liste)),
        ),
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
        onPressed: createChecklist,
        tooltip: 'Neue Checkliste erstellen',
        backgroundColor: Colors.grey,
        child: Icon(Icons.add),
      ),
    );
  }

  void onPressed() {}

  void showChecklist(Checkliste checklist) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Haeckchen(checklist)))
        .then((value) => refresh());
  }

  void createChecklist() {
    Navigator.of(context)
        .push(
            MaterialPageRoute(builder: (context) => NeueChecklisteErstellen()))
        .then((checklist) => addChecklist(checklist));
  }

  void refresh() {
    setState(() {});
  }

  addChecklist(Checkliste? checklist) async {
    widget.startseitenListen.add(checklist!);
    LokalesSpeichern().dateienSpeichern(widget.startseitenListen);
    var x = await LokalesSpeichern().dateienAusgeben();
    refresh();
  }

  void _showPopupMenu(Offset globalPosition) async {
    double left = globalPosition.dx;
    double top = globalPosition.dy;
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(left, top, 100, 100),
      color: Colors.grey,
      items: [
        PopupMenuItem(
          value: 1,
          child: Text("View"),
        ),
        PopupMenuItem(
          value: 2,
          child: Text("Edit"),
        ),
        PopupMenuItem(
          value: 3,
          child: Text("Delete"),
        ),
      ],
      elevation: 8.0,
    ).then((value) {
// NOTE: even you didnt select item this method will be called with null of value so you should call your call back with checking if value is not null

      if (value != null) print(value);
    });
  }
}
