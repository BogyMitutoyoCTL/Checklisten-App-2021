import 'package:flutter/cupertino.dart';

class Checkliste {
  Image? bild;
  String titel = "";
  String notizen = "";
  late List<Eintrag> eintraege = [];
  Checkliste(
      {this.titel = "",
      this.notizen = "",
      List<Eintrag>? eintraege,
      this.bild}) {
    if (eintraege != null) {
      this.eintraege = eintraege;
    }
  }
}

class Eintrag {
  String text = "";
  bool erledigt = false;
  int? anzahl = 0;
  Eintrag({required this.text, bool? erledigt, this.anzahl}) {
    if (erledigt != null) {
      this.erledigt = erledigt;
    }
  }
}
