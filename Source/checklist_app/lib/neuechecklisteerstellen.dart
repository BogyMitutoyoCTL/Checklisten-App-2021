import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
              autofocus: false,
              controller: titelController,
              textAlign: TextAlign.center,
              decoration: InputDecoration.collapsed(
                  hintText:
                      (AppLocalizations.of(context)!.name_of_the_checklist),
                  border: InputBorder.none))),
      Row(children: [
        Expanded(
          child: TextFormField(
              autofocus: false,
              controller: sachController,
              textAlign: TextAlign.start,
              decoration: InputDecoration.collapsed(
                  hintText: (AppLocalizations.of(context)!
                      .for_example_2pounds_of_bananas),
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
            Text(AppLocalizations.of(context)!.create_a_checklist),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: children2),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: FloatingActionButton(
              onPressed: photo,
              tooltip: (AppLocalizations.of(context)!.pick_image),
              child: Icon(Icons.photo),
            ),
          ),
          FloatingActionButton(
            onPressed: speichern,
            tooltip: (AppLocalizations.of(context)!.save),
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
