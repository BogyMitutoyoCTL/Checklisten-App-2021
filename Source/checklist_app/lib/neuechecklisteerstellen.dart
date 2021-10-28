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
  final TextEditingController titelController = TextEditingController();
  final TextEditingController sachController = TextEditingController();
  Checkliste c = new Checkliste();
  String sachString = "";

  get onPressed => null;

  @override
  void initState() {
    super.initState();

    titelController.text = c.titel;
    titelController.addListener(() {
      setState(() {
        c.titel = titelController.text;
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
    titelController.dispose();
    sachController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> listezumAnzeigen = [];
    for (var eintrag in c.eintraege) {
      Widget grossserText = Row(
        children: [
          Expanded(child: Text(eintrag.text)),
          ElevatedButton(
              onPressed: () => loeschen(eintrag),
              child: Icon(Icons.backspace_outlined))
        ],
      );
      listezumAnzeigen.add(grossserText);
    }

    List<Widget> children2 = [
      Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: TextFormField(
              controller: titelController,
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
    Navigator.of(context).pop(c);
  }

  void hinzufuegen() {
    if (sachString != "") {
      var e = Eintrag(text: sachString);
      c.eintraege.add(e);
      sachString = "";
      sachController.text = "";
      setState(() {});
    }
  }

  void loeschen(Eintrag eintrag) {
    c.eintraege.remove(eintrag);
    setState(() {});
  }
}
