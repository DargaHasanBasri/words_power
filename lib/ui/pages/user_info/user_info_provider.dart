import 'package:words_power/export.dart';
import 'package:words_power/ui/pages/user_info/user_info_page.dart';
import 'package:words_power/ui/pages/user_info/user_info_view_model.dart';

class UserInfoProvider extends StatelessWidget {
  const UserInfoProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return UserInfoViewModel();
      },
      child: const UserInfoPage(),
    );
  }
}
