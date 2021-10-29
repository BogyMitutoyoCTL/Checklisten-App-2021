import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'klassecheckliste.dart';

class ChecklisteBearbeiten extends StatefulWidget {
  Checkliste c;
  ChecklisteBearbeiten(Checkliste this.c, {Key? key}) : super(key: key);

  @override
  _ChecklisteBearbeitenState createState() => _ChecklisteBearbeitenState();
}

class _ChecklisteBearbeitenState extends State<ChecklisteBearbeiten> {
  final TextEditingController titelController = TextEditingController();
  final TextEditingController sachController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  String sachString = "";

  get onPressed => null;

  @override
  void initState() {
    super.initState();

    titelController.text = widget.c.titel;
    titelController.addListener(() {
      setState(() {
        widget.c.titel = titelController.text;
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
    for (var eintrag in widget.c.eintraege) {
      Widget grossserText = Row(
        children: [
          Expanded(child: Text(eintrag.text)),
          ElevatedButton(
              onPressed: () => loeschen(eintrag),
              child: Icon(Icons.backspace_outlined)),
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
                  hintText: "zum Beispiel 1kg Bananen",
                  border: InputBorder.none)),
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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: FloatingActionButton(
              onPressed: photo,
              tooltip: "Bild auswählen",
              child: Icon(Icons.photo),
            ),
          ),
          FloatingActionButton(
            onPressed: speichern,
            tooltip: "Speichern",
            child: Icon(Icons.save_alt),
          ),
        ],
      ),
    );
  }

  void speichern() {
    Navigator.of(context).pop(widget.c);
  }

  void hinzufuegen() {
    if (sachString != "") {
      var e = Eintrag(text: sachString);
      widget.c.eintraege.add(e);
      sachString = "";
      sachController.text = "";
      setState(() {});
    }
  }

  void loeschen(Eintrag eintrag) {
    widget.c.eintraege.remove(eintrag);
    setState(() {});
  }

  void photo() {
    callCamera();
  }

  Future<void> callCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      widget.c.bild = File(image.path);
    }
  }
}
