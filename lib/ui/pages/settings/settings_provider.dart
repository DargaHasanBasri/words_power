import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_power/ui/pages/settings/setting_view_model.dart';
import 'package:words_power/ui/pages/settings/settings_page.dart';

class SettingsProvider extends StatelessWidget {
  const SettingsProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return SettingsViewModel();
      },
      child: const SettingsPage(),
    );
  }
}
