import 'package:flutter/material.dart';

class NeueChecklisteErstellen extends StatefulWidget {
  const NeueChecklisteErstellen({Key? key}) : super(key: key);

  @override
  _NeueChecklisteErstellenState createState() =>
      _NeueChecklisteErstellenState();
}

class _NeueChecklisteErstellenState extends State<NeueChecklisteErstellen> {
  final TextEditingController namenController = TextEditingController();
  final TextEditingController sachController = TextEditingController();
  String sachText = "";
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

    sachController.text = sachText;
    sachController.addListener(() {
      setState(() {
        sachText = sachController.text;
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
    List<Text> listezumAnzeigen = [];
    for (var neuerString in sachStrings) {
      var grossserText = Text(neuerString);
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
      Row(
        children: [
          ElevatedButton(
            onPressed: hinzufuegen,
            child: Icon(Icons.add_circle_outline),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(3),
            ),
          ),
          Center(
            child: Container(
              width: 200,
              height: 20,
              child: TextFormField(
                  controller: sachController,
                  textAlign: TextAlign.center,
                  autofocus: true,
                  decoration: InputDecoration.collapsed(
                      hintText: "zum Beispiel Banane",
                      border: InputBorder.none)),
            ),
          ),
        ],
      )
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
      body: Column(children: children2),
      floatingActionButton: FloatingActionButton(
        onPressed: speichern,
        tooltip: "Speichern",
        child: Icon(Icons.save_alt),
      ),
    );
  }

  void speichern() {}

  void hinzufuegen() {
    sachStrings.add(sachText);
    sachText = "";
    sachController.text = "";
    setState(() {});
  }
}
