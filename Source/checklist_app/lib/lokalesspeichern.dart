import 'package:localstore/localstore.dart';
import 'klassecheckliste.dart';

class LokalesSpeichern {
  String id = "id";
  String path = "path";
  LokalesSpeichern(String id, String path) {
    this.id = id;
    this.path = path;
  }
  void dateienSpeichern(List<Checkliste> checklist) {
    final instance = Localstore.instance;
    instance.collection(this.path).doc(this.id).set({"checklist": checklist});
  }

  Future<List> dateienAusgeben() async {
    final instance = Localstore.instance;
    Map<String, dynamic>? savedData =
        await instance.collection(this.path).doc(this.id).get();
    var checkListen = savedData!["checklist"];
    return checkListen;
  }

  void dateienLoeschen() {
    final instance = Localstore.instance;
    instance.collection(this.path).doc(this.id).delete();
  }
}
