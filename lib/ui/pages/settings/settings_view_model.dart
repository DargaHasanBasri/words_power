import 'package:words_power/base/base_view_model.dart';

import 'package:words_power/export.dart';

class SettingsViewModel extends BaseViewModel {
  SettingsViewModel(this.userModel);
  final UserModel? userModel;

  Future<void> logOut() async {
    debugPrint('çıkış yapıldı');
    AuthenticationService().signOut;
    await localStorage.logout();
  }
}
