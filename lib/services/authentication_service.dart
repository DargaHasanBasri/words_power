import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:words_power/models/user_model.dart';

class AuthenticationService {
  final userCollection = FirebaseFirestore.instance.collection('users');
  final firebaseAuth = FirebaseAuth.instance;
  String profileNullPhoto =
      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png';

  Future<bool> signUp({
    required String email,
    required String password,
    required String userName,
  }) async {
    try {
      final userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }

  Future<bool> sigIn({required String email, required String password}) async {
    try {
      final userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        debugPrint('başarılı giriş');
        debugPrint(userCredential.user!.email);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      debugPrint('başarısız');
    }
    return false;
  }

  Future<void> saveUserInfoToFirebase(UserModel userModel) async {
    userModel.profilePhoto ??= profileNullPhoto;
    userModel.userID = firebaseAuth.currentUser!.uid;
    await userCollection
        .doc(firebaseAuth.currentUser!.uid)
        .set(userModel.toMap());

    debugPrint('userID: ${userModel.userID}');
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
