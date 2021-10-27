import 'package:checklist_app/klassecheckliste.dart';
import 'package:checklist_app/startseite.dart';
import 'package:flutter/material.dart';
import 'lokalesspeichern.dart';

void main() {
  LokalesSpeichern save = LokalesSpeichern(path: 'path', id: 'id');

  Eintrag eintrag1 = Eintrag(text: 'Gemüse', anzahl: 3, erledigt: true);

  Eintrag eintrag2 = Eintrag(text: 'Obst', erledigt: false, anzahl: 5);

  Eintrag eintrag4 = Eintrag(text: 'Süßigkeiten');

  List<Eintrag> eintragliste1 = [eintrag1, eintrag2, eintrag4];

  Eintrag eintrag3 = Eintrag(text: 'Stifte', anzahl: 10);

  List<Eintrag> eintragliste2 = [eintrag3];

  Checkliste liste1 = Checkliste(
      titel: 'Einkaufsliste',
      notizen: 'Beim Aldi einkaufen',
      eintraege: eintragliste1); //new

  Checkliste liste2 = Checkliste(
      titel: 'Schulliste',
      notizen: 'Schachen für die Schule einkaufen',
      eintraege: eintragliste2);

  List<Checkliste> demochecklisten = [liste1, liste2];

  runApp(BogyChecklistApp(demochecklisten, save));
}

class BogyChecklistApp extends StatelessWidget {
  late List<Checkliste> appListen;
  late LokalesSpeichern listenSpeicher;
  BogyChecklistApp(List<Checkliste> demochecklisten, LokalesSpeichern save) {
    appListen = demochecklisten;
    listenSpeicher = save;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.grey,
          canvasColor: Color.fromARGB(254, 190, 195, 200)),
      home: Startseite(
        appListen,
        listenSpeicher,
      ),
    );
  }
}
