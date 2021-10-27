import 'package:flutter/cupertino.dart';

class Checkliste {
  Image? bild;
  String titel = "";
  String notizen = "";
  List<Eintrag> eintraege = [];
  Checkliste(
      {required this.titel,
      required this.notizen,
      required this.eintraege,
      this.bild});
}

class Eintrag {
  String text = "";
  bool erledigt = false;
  int? anzahl = 0;
  Eintrag({required this.text, erledigt, this.anzahl}) {
    this.erledigt = erledigt;
  }
}
