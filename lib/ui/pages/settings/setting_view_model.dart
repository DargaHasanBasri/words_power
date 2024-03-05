import 'package:flutter/material.dart';
import 'package:words_power/base/base_view_model.dart';

import '../../../models/user_model.dart';
import '../../../services/authentication_service.dart';

class SettingsViewModel extends BaseViewModel {
  final UserModel? userModel;
  SettingsViewModel(this.userModel);

  Future<void> logOut() async {
    AuthenticationService().signOut;
    debugPrint("çıkış yapıldı");
    await localStorage.logout();
  }
}
