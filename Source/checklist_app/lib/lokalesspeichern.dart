import 'package:localstore/localstore.dart';
import 'klassecheckliste.dart';

class LokalesSpeichern {
  String id = 'id';
  String path = 'path';
  final checklistkey = 'checklist';

  void dateienSpeichern(List<Checkliste> checklist) {
    final instance = Localstore.instance;
    instance
        .collection(this.path)
        .doc(this.id)
        .set({checklistkey: checklist[0].toMap()});
  }

  Future<List<Checkliste>?> dateienAusgeben() async {
    final instance = Localstore.instance;
    Map<String, dynamic>? savedData =
        await instance.collection(this.path).doc(this.id).get();
    if (savedData == null) {
      return [];
    }
    return [toCheckliste(savedData)];
  }

  void dateienLoeschen() {
    final instance = Localstore.instance;
    instance.collection(this.path).doc(this.id).delete();
  }
}
