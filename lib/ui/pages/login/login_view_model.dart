import 'package:flutter/material.dart';
import 'package:words_power/base/base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  TextEditingController controllerMailAddress = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  ValueNotifier<String> mailAddress = ValueNotifier("");
  ValueNotifier<String> password = ValueNotifier("");

  bool isEmpty() => mailAddress.value.isNotEmpty && password.value.isNotEmpty;
}
