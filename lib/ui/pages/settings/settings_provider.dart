import '../../../export.dart';
import 'settings_view_model.dart';
import 'settings_page.dart';

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
