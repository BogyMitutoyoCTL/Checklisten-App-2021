import 'dart:io';

const mapText = 'Text';
const mapErledigt = 'Erledigt';
const mapAnzahl = 'Anzahl';

const mapTitel = 'Titel';
const mapNotizen = 'Notizen';
const mapEintraege = 'Eintraege';
const mapBild = 'Bild';

class Checkliste {
  File? bild;
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

  Map toMap() {
    var map = {};
    map[mapTitel] = this.titel;
    map[mapNotizen] = this.notizen;
    if (this.bild != null) {
      map[mapBild] = this.bild!.path;
    }
    List<Map> entries = [];
    for (var entry in this.eintraege) {
      entries.add(entry.toMap());
    }
    map[mapEintraege] = entries;
    return map;
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

  Map toMap() {
    var map = {};
    map[mapText] = this.text;
    map[mapErledigt] = this.erledigt;
    map[mapAnzahl] = this.anzahl;
    return map;
  }
}

Checkliste toCheckliste(map) {
  List<Eintrag> eintraege = [];
  for (var mapEntry in map[mapEintraege]) {
    eintraege.add(toEintrag(mapEntry));
  }
  if (map[mapBild] != null) {
    return Checkliste(
        titel: map[mapTitel],
        notizen: map[mapNotizen],
        eintraege: eintraege,
        bild: File(map[mapBild]));
  } else {
    return Checkliste(
      titel: map[mapTitel],
      notizen: map[mapNotizen],
      eintraege: eintraege,
    );
  }
}

Eintrag toEintrag(Map map) {
  return Eintrag(
      text: map[mapText], anzahl: map[mapAnzahl], erledigt: map[mapErledigt]);
}
