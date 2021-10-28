import 'package:checklist_app/klassecheckliste.dart';
import 'package:checklist_app/lokalesspeichern.dart';
import 'package:checklist_app/startseite.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LokalesSpeichern().dateienLoeschen();
  List<Checkliste>? allLists = await LokalesSpeichern().dateienAusgeben();
  runApp(BogyChecklistApp(allLists!));
}

class BogyChecklistApp extends StatelessWidget {
  late List<Checkliste> appListen;
  BogyChecklistApp(List<Checkliste> allLists) {
    appListen = allLists;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.grey,
          canvasColor: Color.fromARGB(254, 190, 195, 200)),
      home: Startseite(appListen),
    );
  }
}
