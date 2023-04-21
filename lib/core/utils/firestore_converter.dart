import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreConverter {
  static Map<String, dynamic> snapshotToMap(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final json = snapshot.data();
    if (json == null) throw Exception("Provided snapshot data is null");
    json.addAll({"id": snapshot.id});
    return json;
  }
}
