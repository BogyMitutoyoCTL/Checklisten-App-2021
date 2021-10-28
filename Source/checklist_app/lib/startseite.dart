import 'package:checklist_app/haeckchen.dart';
import 'package:checklist_app/klassecheckliste.dart';
import 'package:checklist_app/lokalesspeichern.dart';
import 'package:checklist_app/neuechecklisteerstellen.dart';
import 'package:checklist_app/suchleiste.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
              _showPopupMenu(details.globalPosition, liste),
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
        leading: PopupMenuButton(
            onSelected: popupmenueselected,
            color: Colors.grey,
            itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text("Sprache ändern"),
                    value: 2,
                  ),
                  PopupMenuItem(
                    child: Text("Fehler melden"),
                    value: 3,
                  ),
                  PopupMenuItem(
                    child: Text("Feature Wunsch"),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Text("Freunde einladen "),
                    value: 4,
                  ),
                ]),
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
        .push(MaterialPageRoute(
            builder: (context) => ChecklisteBearbeiten(new Checkliste())))
        .then((checklist) => addChecklist(checklist));
  }

  void refresh() {
    setState(() {});
  }

  addChecklist(Checkliste checklist) async {
    widget.startseitenListen.add(checklist);
    LokalesSpeichern().dateienSpeichern(widget.startseitenListen);
    refresh();
  }

  void _showPopupMenu(Offset globalPosition, Checkliste liste) async {
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
      if (1 == value) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Haeckchen(liste)))
            .then((value) => refresh());
      }
      if (3 == value) {
        for (var locallist in widget.startseitenListen) {
          if (locallist.eintraege == liste.eintraege) {
            widget.startseitenListen.remove(locallist);
          }
        }
        setState(() {});
        refresh();
        print(widget.startseitenListen.first.titel);
      }
    });
  }

  void popupmenueselected(int value) {
    if (1 == value) {
      //Feature Wunsch
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => WebView(
                initialUrl:
                    "https://github.com/BogyMitutoyoCTL/Checklisten-App-2021/issues/",
              )));
    }
    if (2 == value) {
      //Sprache ändern}
      if (3 == value) {
        //Fehler melden
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => WebView(
                  initialUrl:
                      "https://github.com/BogyMitutoyoCTL/Checklisten-App-2021/issues/",
                )));
      }
      if (4 == value) {} // Freunde einladen

    }
  }
}
