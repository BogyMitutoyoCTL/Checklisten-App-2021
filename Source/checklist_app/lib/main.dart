import 'package:checklist_app/klassecheckliste.dart';
import 'package:checklist_app/startseite.dart';
import 'package:flutter/material.dart';

void main() {
  List<Checkliste> demochecklisten = [];
  Checkliste c = Checkliste(); //new
  c.titel = "einkaufsliste";
  c.notizen = "beim Aldi einkaufen";

  Eintrag g = Eintrag();
  g.text = "gemüse";
  g.anzahl = 3;
  g.erledigt = true;
  c.eintraege.add(g);
  Eintrag o = Eintrag();
  o.text = "Obst";
  o.anzahl = 5;
  o.erledigt = false;
  c.eintraege.add(o);
  demochecklisten.add(c);

  Checkliste s = Checkliste();
  s.titel = "schulliste";
  s.notizen = "Sachen für die Schule einkaufen";

  Eintrag st = Eintrag();
  st.text = "Stifte";
  st.anzahl = 10;
  s.eintraege.add(st);
  demochecklisten.add(s);

  runApp(BogyChecklistApp());
}

class BogyChecklistApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.grey,
          canvasColor: Color.fromARGB(254, 190, 195, 200)),
      home: Startseite(),
    );
  }
}
