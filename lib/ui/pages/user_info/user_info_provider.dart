import 'package:words_power/export.dart';
import 'package:words_power/ui/pages/user_info/user_info_page.dart';
import 'package:words_power/ui/pages/user_info/user_info_view_model.dart';

class UserInfoProvider extends StatelessWidget {
  final UserModel? userModel;
  const UserInfoProvider(this.userModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return UserInfoViewModel(userModel);
      },
      child: const UserInfoPage(),
    );
  }
}
