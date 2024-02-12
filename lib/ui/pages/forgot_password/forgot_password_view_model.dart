import 'package:flutter/material.dart';
import 'package:words_power/base/base_view_model.dart';

class ForgotPasswordViewModel extends BaseViewModel {

  TextEditingController controllerMailAddress = TextEditingController();
  ValueNotifier<String> mailAddress = ValueNotifier("");

}