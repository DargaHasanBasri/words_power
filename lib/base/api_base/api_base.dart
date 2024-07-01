import 'package:cloud_firestore/cloud_firestore.dart';

class ApiBase {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addDocument(
      String collectionPath, String docId, Map<String, dynamic> data) {
    return _db.collection(collectionPath).doc(docId).set(data);
  }

  Future<void> updateDocument(
      String collectionPath, String docId, Map<String, dynamic> data) {
    return _db.collection(collectionPath).doc(docId).update(data);
  }

  Stream<List<Map<String, dynamic>>> getDocuments(String collectionPath) {
    return _db.collection(collectionPath).snapshots().map((snapshot) =>
        snapshot.docs.map((document) => document.data()).toList());
  }

  Future<void> deleteDocument(String collectionPath, String docId) {
    return _db.collection(collectionPath).doc(docId).delete();
  }

  Future<Map<String, dynamic>?> getDocumentById(
      String collectionPath, String docId) async {
    DocumentSnapshot document =
        await _db.collection(collectionPath).doc(docId).get();
    return document.exists ? document.data() as Map<String, dynamic>? : null;
  }

  Stream<List<Map<String, dynamic>>> getDocumentsByField(
      String collectionPath, String field, String value) {
    return _db
        .collection(collectionPath)
        .where(field, isEqualTo: value)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((document) => document.data()).toList());
  }
}
