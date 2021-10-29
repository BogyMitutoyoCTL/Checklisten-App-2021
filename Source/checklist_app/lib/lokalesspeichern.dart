import 'package:localstore/localstore.dart';
import 'klassecheckliste.dart';

class LokalesSpeichern {
  String id = 'id';
  String path = 'path';
  final checklistkey = 'checklist';

  void dateienSpeichern(List<Checkliste> checklist) {
    final instance = Localstore.instance;
    Map<String, dynamic> allMaps = {};
    var counter = 0;
    for (var list in checklist) {
      allMaps[counter.toString()] = list.toMap();
      counter++;
    }
    instance.collection(this.path).doc(this.id).set(allMaps);
  }

  Future<List<Checkliste>?> dateienAusgeben() async {
    final instance = Localstore.instance;
    Map<String, dynamic>? savedData =
        await instance.collection(this.path).doc(this.id).get();
    if (savedData == null) {
      return [];
    } else {
      var counter = 0;
      List<Checkliste> list = [];
      while (savedData[counter.toString()] != null) {
        list.add(toCheckliste(savedData[counter.toString()]));
        counter++;
      }
      return list;
    }
  }

  void dateienLoeschen() {
    final instance = Localstore.instance;
    instance.collection(this.path).doc(this.id).delete();
  }
}
