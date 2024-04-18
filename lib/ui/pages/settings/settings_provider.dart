import 'package:words_power/export.dart';
import 'package:words_power/ui/pages/settings/settings_page.dart';
import 'package:words_power/ui/pages/settings/settings_view_model.dart';

class SettingsProvider extends StatelessWidget {
  const SettingsProvider(this.userModel, {super.key});
  final UserModel? userModel;

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
