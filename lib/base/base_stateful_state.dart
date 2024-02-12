import 'package:flutter/material.dart';

abstract class BaseStatefulState<T extends StatefulWidget> extends State<T> {
  void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(text)));
  }
}