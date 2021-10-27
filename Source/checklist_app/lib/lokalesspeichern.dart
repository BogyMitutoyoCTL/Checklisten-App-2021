import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:localstore/localstore.dart';
import 'klassecheckliste.dart';

class LokalesSpeichern {
  String id = "id";
  String path = "path";
  LokalesSpeichern(String id, String path) {
    this.id = id;
    this.path = path;
  }
  void dateienSpeichern(List checklisten) {
    final instance = Localstore.instance;
    Map<String, Checkliste> checkMap = {};
    checklisten
        .forEach((Checkliste) => checkMap[Checkliste.titel] = Checkliste);
    instance.collection(this.path).doc(this.id).set(checkMap);
  }

  List dateienAusgeben() {
    return [];
  }

  void dateienLoeschen() {}
}
