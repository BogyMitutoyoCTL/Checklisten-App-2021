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

  Future<List> dateienAusgeben() async {
    final instance = Localstore.instance;
    Map<String, dynamic>? datei =
        await instance.collection(this.path).doc(this.id).get();
    var checkListen = [];
    datei!.forEach((key, value) => checkListen.add(value));
    return checkListen;
  }

  void dateienLoeschen() {
    final instance = Localstore.instance;
    instance.collection(this.path).doc(this.id).delete();
  }
}
