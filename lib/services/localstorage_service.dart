import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static SharedPreferences? _preferences;

  Future<void> getInstance() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  String? getString(String key) {
     return _preferences?.getString(key);
  }

  Future<void> setString(String key, String value) async {
    await _preferences?.setString(key, value);
  }

  Future<void> logout() async {
    await _preferences?.remove("mail");
  }

  bool isLoggedIn() {
    return _preferences?.getString("mail") != null;
  }
}
