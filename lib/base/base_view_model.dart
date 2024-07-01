import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:words_power/base/api_base/repository.dart';
import 'package:words_power/services/localstorage_service.dart';
import 'package:words_power/services/service_locator.dart';

class BaseViewModel extends ChangeNotifier {
  final fireBaseFirestore = FirebaseFirestore.instance;
  final firebaseAuth = FirebaseAuth.instance;
  final LocalStorageService localStorage = LocalStorageService();
  final Repository repository = locator<Repository>();

}
