import 'package:flutter/material.dart';
import 'package:words_power/base/base_view_model.dart';

import '../../../services/authentication_service.dart';

class LoginViewModel extends BaseViewModel {
  TextEditingController controllerMailAddress = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  ValueNotifier<String> mailAddress = ValueNotifier("");
  ValueNotifier<String> password = ValueNotifier("");
  ValueNotifier<bool> isLogin = ValueNotifier(false);

  bool isEmpty() => mailAddress.value.isNotEmpty && password.value.isNotEmpty;

  Future<void> login() async {
    if (isEmpty()) {
      isLogin.value = await AuthenticationService().sigIn(email: mailAddress.value, password: password.value);
    }
  }
}
