import 'package:flutter/material.dart';

import '../services/authentication_service.dart';

abstract class BaseStatefulState<T extends StatefulWidget> extends State<T> {
  AuthenticationService userInfo = AuthenticationService();
  void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(text)));
  }
}