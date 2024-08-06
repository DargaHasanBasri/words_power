import 'package:words_power/export.dart';
import 'package:words_power/ui/pages/detail_user/detail_user_page.dart';
import 'package:words_power/ui/pages/detail_user/detail_user_view_model.dart';

class DetailUserProvider extends StatelessWidget {
  const DetailUserProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return DetailUserViewModel();
      },
      child: const DetailUserPage(),
    );
  }
}
