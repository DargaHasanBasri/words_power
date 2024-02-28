import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/word_and_sentence_model.dart';

class WordAndSentenceAddRepository {
  final FirebaseFirestore firebaseFirestore;
  final firebaseAuth = FirebaseAuth.instance;

  WordAndSentenceAddRepository(this.firebaseFirestore);

  Future<void> addWordAndSentence(WordAndSentenceModel model) async {
    await firebaseFirestore
        .collection("wordAndSentence")
        .doc(model.userID)
        .set(model.toMap());
    await addSubCollection("users", firebaseAuth.currentUser!.uid,
        "wordAndSentence", model.userID, model.toMap());
  }

  Future<void> addSubCollection(
      String collectionName,
      String docId,
      String subCollectionName,
      String subCollectionDocId,
      Map<String, dynamic> data) async {
    await firebaseFirestore
        .collection(collectionName)
        .doc(docId)
        .collection(subCollectionName)
        .doc(subCollectionDocId)
        .set(data);
  }
}
