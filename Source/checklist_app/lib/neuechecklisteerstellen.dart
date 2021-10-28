import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'klassecheckliste.dart';

class NeueChecklisteErstellen extends StatefulWidget {
  const NeueChecklisteErstellen({Key? key}) : super(key: key);

  @override
  _NeueChecklisteErstellenState createState() =>
      _NeueChecklisteErstellenState();
}

class _NeueChecklisteErstellenState extends State<NeueChecklisteErstellen> {
  final TextEditingController namenController = TextEditingController();
  final TextEditingController sachController = TextEditingController();
  String sachString = "";
  String checklistenName = "";
  List<String> sachStrings = [];

  get onPressed => null;

  @override
  void initState() {
    super.initState();

    namenController.text = checklistenName;
    namenController.addListener(() {
      setState(() {
        checklistenName = namenController.text;
      });
    });

    sachController.text = sachString;
    sachController.addListener(() {
      setState(() {
        sachString = sachController.text;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    namenController.dispose();
    sachController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> listezumAnzeigen = [];
    for (var neuerString in sachStrings) {
      Widget grossserText = Row(
        children: [
          Expanded(child: Text(neuerString)),
          ElevatedButton(
              onPressed: () => loeschen(neuerString),
              child: Icon(Icons.backspace_outlined))
        ],
      );
      listezumAnzeigen.add(grossserText);
    }

    List<Widget> children2 = [
      Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: TextFormField(
              controller: namenController,
              textAlign: TextAlign.center,
              autofocus: true,
              decoration: InputDecoration.collapsed(
                  hintText: "Name der Checkliste", border: InputBorder.none))),
      Row(children: [
        Expanded(
          child: TextFormField(
              controller: sachController,
              textAlign: TextAlign.start,
              autofocus: true,
              decoration: InputDecoration.collapsed(
                  hintText: "zum Beispiel Banane", border: InputBorder.none)),
        ),
        ElevatedButton(
          onPressed: hinzufuegen,
          child: Icon(Icons.add_circle_outline),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(3),
          ),
        ),
      ]),
    ];
    children2.addAll(listezumAnzeigen);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Erstelle eine Checkliste"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: children2),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: speichern,
        tooltip: "Speichern",
        child: Icon(Icons.save_alt),
      ),
    );
  }

  void speichern() {
    List<Eintrag> eintraege = [];
    for (var eintrag in sachStrings) {
      if (eintrag != '') {
        eintraege.add(Eintrag(text: eintrag));
      }
    }
    if (sachString != null) {
      eintraege.add(Eintrag(text: sachString));
    }
    var checkliste = new Checkliste(
        titel: checklistenName, eintraege: eintraege, notizen: '');
    Navigator.of(context).pop(checkliste);
  }

  void hinzufuegen() {
    if (sachString != "") {
      sachStrings.add(sachString);
      sachString = "";
      sachController.text = "";
      setState(() {});
    }
  }

  void loeschen(String neuerString) {
    sachStrings.remove(neuerString);
    setState(() {});
  }
}
