import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:words_power/models/user_model.dart';

class AuthenticationService {
  final userCollection = FirebaseFirestore.instance.collection("users");
  final firebaseAuth = FirebaseAuth.instance;

  Future<bool> signUp(UserModel userModel) async {
    try {
      final UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(email: userModel.email, password: userModel.password);
      if (userCredential.user != null) {
        _registerUser(userModel, userCredential);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }

  Future<bool> sigIn({required String email, required String password}) async {
    try {
      final UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
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

  Future<void> _registerUser(UserModel userModel, UserCredential userCredential) async {
    await userCollection.doc(userCredential.user!.uid).set({
      "email": userModel.email,
      "name": userModel.name,
      "password": userModel.password,
      "surname": userModel.surname,
    });
  }
}
