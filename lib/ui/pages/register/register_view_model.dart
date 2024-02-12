import 'package:flutter/material.dart';
import 'package:words_power/base/base_view_model.dart';
import 'package:words_power/services/authentication_service.dart';

import '../../../models/user_model.dart';

class RegisterViewModel extends BaseViewModel {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerSurname = TextEditingController();
  TextEditingController controllerMailAddress = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  ValueNotifier<String> name = ValueNotifier("");
  ValueNotifier<String> surname = ValueNotifier("");
  ValueNotifier<String> mailAddress = ValueNotifier("");
  ValueNotifier<String> password = ValueNotifier("");
  ValueNotifier<bool> isRegister = ValueNotifier(false);

  bool isEmpty() =>
      mailAddress.value.isNotEmpty && password.value.isNotEmpty && name.value.isNotEmpty && surname.value.isNotEmpty;

  Future<void> register(UserModel userModel) async {
    if (isEmpty()) {
      isRegister.value = await AuthenticationService().signUp(userModel);
    }
  }
}
