import 'package:checklist_app/haeckchen.dart';
import 'package:checklist_app/klassecheckliste.dart';
import 'package:checklist_app/lokalesspeichern.dart';
import 'package:checklist_app/neuechecklisteerstellen.dart';
import 'package:checklist_app/suchleiste.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
  String gesuchtesWort = "";
  @override
  Widget build(BuildContext context) {
    LokalesSpeichern().dateienSpeichern(widget.startseitenListen);
    List<Container> containerliste = [];
    for (var liste in widget.startseitenListen) {
      if (!liste.titel.toLowerCase().contains(gesuchtesWort.toLowerCase())) {
        continue;
      }
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
                children: [Expanded(child: Text(liste.titel)), Icon(icon)],
              )),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 100),
                textStyle: Theme.of(context).primaryTextTheme.bodyText1,
              ),
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
                    child: Text(
                      AppLocalizations.of(context)!.report_Bug,
                      style: Theme.of(context).primaryTextTheme.bodyText1,
                    ),
                    value: 6,
                  ),
                  PopupMenuItem(
                    child: Text(AppLocalizations.of(context)!.feature_wish),
                    textStyle: Theme.of(context).primaryTextTheme.bodyText1,
                    value: 5,
                  ),
                  PopupMenuItem(
                    child: Text(AppLocalizations.of(context)!.invite_friends),
                    textStyle: Theme.of(context).primaryTextTheme.bodyText1,
                    value: 4,
                  ),
                ]),
        title: Text(AppLocalizations.of(context)!.your_Checklists),
        textTheme: Theme.of(context).primaryTextTheme,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Suchleiste(gesuchtesWortAktualisieren),
            Column(
              children: containerliste,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createChecklist,
        tooltip: (AppLocalizations.of(context)!.create_new_checklist),
        backgroundColor: Colors.grey,
        child: Icon(Icons.add),
      ),
    );
  }

  void gesuchtesWortAktualisieren(String wort) {
    gesuchtesWort = wort;
    refresh();
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

  addChecklist(Checkliste? checklist) {
    widget.startseitenListen.add(checklist!);
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
          child: Text(AppLocalizations.of(context)!.view),
          textStyle: Theme.of(context).primaryTextTheme.bodyText1,
        ),
        PopupMenuItem(
          value: 2,
          child: Text(AppLocalizations.of(context)!.edit),
          textStyle: Theme.of(context).primaryTextTheme.bodyText1,
        ),
        PopupMenuItem(
          value: 3,
          child: Text(AppLocalizations.of(context)!.delete),
          textStyle: Theme.of(context).primaryTextTheme.bodyText1,
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
      if (2 == value) {
        Navigator.of(context)
            .push(MaterialPageRoute(
                builder: (context) => ChecklisteBearbeiten(liste)))
            .then((value) => refresh());
      }

      if (3 == value) {
        widget.startseitenListen.remove(liste);
        refresh();
      }
    });
  }

  void popupmenueselected(int value) {
    if (5 == value) {
      //Feature Wunsch
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => WebView(
                initialUrl:
                    "https://github.com/BogyMitutoyoCTL/Checklisten-App-2021/issues/",
              )));
    }

    if (6 == value) {
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
