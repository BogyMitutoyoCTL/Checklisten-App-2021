import 'package:checklist_app/klassecheckliste.dart';
import 'package:checklist_app/startseite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  Eintrag eintrag1 = Eintrag(text: 'Gemüse', anzahl: 3, erledigt: true);

  Eintrag eintrag2 = Eintrag(text: 'Obst', erledigt: false, anzahl: 5);

  Eintrag eintrag4 = Eintrag(text: 'Süßigkeiten');

  List<Eintrag> eintragliste1 = [eintrag1, eintrag2, eintrag4];

  Eintrag eintrag3 = Eintrag(text: 'Stifte', anzahl: 10);

  List<Eintrag> eintragliste2 = [eintrag3];

  Checkliste liste1 = Checkliste(
      titel: 'Einkaufsliste',
      notizen: 'Notizen',
      eintraege: eintragliste1); //new

  Checkliste liste2 = Checkliste(
      titel: 'Schulliste', notizen: 'Notizen', eintraege: eintragliste2);

  List<Checkliste> demochecklisten = [liste1, liste2];

  runApp(BogyChecklistApp(demochecklisten));
}

class BogyChecklistApp extends StatelessWidget {
  late List<Checkliste> appListen;
  BogyChecklistApp(List<Checkliste> demochecklisten) {
    appListen = demochecklisten;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'Checkliste',
      theme: ThemeData(
          primarySwatch: Colors.grey,
          canvasColor: Color.fromARGB(254, 190, 195, 200)),
      home: Startseite(appListen),
    );
  }
}
