import 'package:flutter/cupertino.dart';

class Checkliste {
  Image? bild;
  String titel = "";
  String? notizen = "";
  List<Eintrag> eintraege = [];
}

class Eintrag {
  String text = "";
  bool erledigt = false;
  int? anzahl = 0;
}
