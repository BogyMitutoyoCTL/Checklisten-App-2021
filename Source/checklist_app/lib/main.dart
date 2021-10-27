import 'package:checklist_app/klassecheckliste.dart';
import 'package:checklist_app/startseite.dart';
import 'package:flutter/material.dart';
import 'lokalesspeichern.dart';

void main() {
  LokalesSpeichern save = LokalesSpeichern(path: 'path', id: 'id');

  Eintrag g = Eintrag();
  g.text = "gemüse";
  g.anzahl = 3;
  g.erledigt = true;
  Eintrag o = Eintrag();
  o.text = "Obst";
  o.anzahl = 5;
  o.erledigt = false;
  List<Eintrag> eintragliste1 = [g, o];

  Eintrag st = Eintrag();
  st.text = "Stifte";
  st.anzahl = 10;

  List<Eintrag> eintragliste2 = [st];

  Checkliste c = Checkliste(
      titel: 'Einkaufsliste',
      notizen: 'Beim Aldi einkaufen',
      eintraege: eintragliste1); //new

  Checkliste s = Checkliste(
      titel: 'Schulliste',
      notizen: 'Schachen für die Schule einkaufen',
      eintraege: eintragliste2);

  List<Checkliste> demochecklisten = [];

  demochecklisten.add(c);
  demochecklisten.add(s);
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
      home: Startseite(appListen, listenSpeicher),
    );
  }
}
