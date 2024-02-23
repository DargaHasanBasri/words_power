import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_power/ui/pages/settings/setting_view_model.dart';
import 'package:words_power/ui/pages/settings/settings_page.dart';

import '../../../models/user_model.dart';

class SettingsProvider extends StatelessWidget {
  final UserModel? userModel;
  const SettingsProvider(this.userModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return SettingsViewModel(userModel);
      },
      child: const SettingsPage(),
    );
  }
}
