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

  @override
  void iniState() {
    super.initState();
    _controller.text = widget.haeckchencheckliste.notizen;
    _controller.addListener(() {
      setState(() {
        widget.haeckchencheckliste.notizen = _controller.text;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> liste = [];
    _controller.text = widget.haeckchencheckliste.notizen;
    liste.add(Padding(
        padding: const EdgeInsets.all(30.0),
        child: TextField(
          autofocus: false,
          controller: _controller,
          textAlign: TextAlign.center,
          onSubmitted: onSubmitted,
          decoration: InputDecoration.collapsed(
              hintText: AppLocalizations.of(context)!.note,
              border: InputBorder.none),
          style: Theme.of(context).primaryTextTheme.bodyText1,
        )));

    var bild = widget.haeckchencheckliste.bild;
    if (bild != null) {
      liste.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.file(
            bild,
            height: 300,
            fit: BoxFit.cover,
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
          Expanded(
              child: GestureDetector(
                  onTap: () => setState(() {
                        eintrag.erledigt = !eintrag.erledigt;
                      }),
                  child: Text(eintrag.text))),
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

  void onSubmitted(String value) {
    widget.haeckchencheckliste.notizen = value;
    refresh();
  }
}
