/// Flutter code sample for Checkbox
import 'package:checklist_app/klassecheckliste.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'neuechecklisteerstellen.dart';

/// This is the stateful widget that the main application instantiates.
class Haeckchen extends StatefulWidget {
  late Checkliste haeckchencheckliste;
  Haeckchen(Checkliste liste, {Key? key}) : super(key: key) {
    haeckchencheckliste = liste;
  }

  @override
  State<Haeckchen> createState() => _HaeckchenState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _HaeckchenState extends State<Haeckchen> {
  @override
  final TextEditingController _controller = TextEditingController();
  String _text = "";

  @override
  void iniState() {
    super.initState();
    _controller.text = _text;
    _controller.addListener(() {
      setState(() {
        _text = _controller.text;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> liste = [];

    liste.add(Padding(
        padding: const EdgeInsets.all(30.0),
        child: TextFormField(
          controller: _controller,
          textAlign: TextAlign.center,
          autofocus: true,
          decoration: InputDecoration.collapsed(
              hintText: widget.haeckchencheckliste.notizen,
              border: InputBorder.none),
        )));

    if (widget.haeckchencheckliste.bild != null) {
      liste.add(Row(
        children: [Image.file(widget.haeckchencheckliste.bild!)],
      ));
    } else {
      liste.add(Row(
        children: [
          Placeholder(
            // Todo: Bild einfügen,
            fallbackHeight: 250,
            fallbackWidth: 392,
          )
        ],
      ));
    }

    for (var eintrag in widget.haeckchencheckliste.eintraege) {
      Row r = Row(
        children: [
          Checkbox(
            checkColor: Colors.white,
            value: eintrag.erledigt,
            onChanged: (bool? value) {
              setState(() {
                eintrag.erledigt = value!;
              });
            },
          ),
          Text(eintrag.text),
        ],
      );
      liste.add(r);
    }

    liste.add(Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
            onPressed: bearbeiten,
            child: Text(AppLocalizations.of(context)!.edit))
      ],
    ));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.haeckchencheckliste.titel),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: liste,
        ),
      ),
    );
  }

  void settings() {}

  void bearbeiten() {
    Navigator.of(context)
        .push(MaterialPageRoute(
            builder: (context) =>
                ChecklisteBearbeiten(widget.haeckchencheckliste)))
        .then((value) => refresh());
  }

  void refresh() {
    setState(() {});
  }
}
