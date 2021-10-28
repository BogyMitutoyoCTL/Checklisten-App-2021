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
              onPressed: () => checklisteanzeigen(liste)),
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
        .push(MaterialPageRoute(builder: (context) => Haeckchen(liste)))
        .then((value) => refresh());
  }

  void neuechecklisteerstellen() {
    Navigator.of(context)
        .push(
            MaterialPageRoute(builder: (context) => NeueChecklisteErstellen()))
        .then((liste) => fuegeNeueChecklisteHinzu(liste));
  }

  void refresh() {
    setState(() {});
  }

  fuegeNeueChecklisteHinzu(List<Checkliste> checkliste) {
    widget.startseitenListen = checkliste;
    refresh();
  }

  void _showPopupMenu(Offset globalPosition) async {
    double left = globalPosition.dx;
    double top = globalPosition.dy;
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(left, top, 100, 100),
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
