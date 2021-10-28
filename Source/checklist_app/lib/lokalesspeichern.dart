import 'package:localstore/localstore.dart';
import 'klassecheckliste.dart';

class LokalesSpeichern {
  String id = 'id';
  String path = 'path';
  final checklistkey = "checklist";

  void dateienSpeichern(List<Checkliste> checklist) {
    // Hier können auch Einstellungen für z.B. Settings hinzugefügt werden
    final instance = Localstore.instance;
    instance.collection(this.path).doc(this.id).set({checklistkey: checklist});
  }

  Future<List> dateienAusgeben() async {
    final instance = Localstore.instance;
    Map<String, dynamic>? savedData =
        await instance.collection(this.path).doc(this.id).get();
    var checkListen = savedData![checklistkey];
    return checkListen;
  }

  void dateienLoeschen() {
    final instance = Localstore.instance;
    instance.collection(this.path).doc(this.id).delete();
  }
}
