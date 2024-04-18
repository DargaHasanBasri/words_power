import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WordSentenceListRepository {
  WordSentenceListRepository(this.firebaseFirestore);

  final FirebaseFirestore firebaseFirestore;
  final firebaseAuth = FirebaseAuth.instance;

}
