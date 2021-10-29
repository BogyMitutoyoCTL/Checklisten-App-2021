import 'package:checklist_app/klassecheckliste.dart';
import 'package:checklist_app/lokalesspeichern.dart';
import 'package:checklist_app/startseite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.checklist,
      theme: ThemeData(
          primarySwatch: Colors.grey,
          primaryTextTheme: TextTheme(
              headline6: TextStyle(
                fontSize: 25.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
              bodyText1: TextStyle(
                fontSize: 16.5,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              )),
          canvasColor: Color.fromARGB(254, 190, 195, 200)),
      home: Startseite(appListen),
    );
  }
}
