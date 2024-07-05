import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ApiBase {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

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

  Future<String?> uploadFile(String filePath, String storagePath) async {
    try {
      File file = File(filePath);
      final storageRef = _storage.ref().child(storagePath);
      await storageRef.putFile(file);
      final downloadURL = await storageRef.getDownloadURL();
      return downloadURL;
    } on FirebaseException catch (e) {
      print("Error uploading file: $e");
      return null;
    }
  }

  Future<void> deleteProfileImage(String imageUrl) async {
    try {
      Reference storageRef = _storage.refFromURL(imageUrl);
      await storageRef.delete();
    } catch (e) {
      print("Error deleting profile image: $e");
    }
  }
}
