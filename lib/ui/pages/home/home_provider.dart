import 'package:words_power/export.dart';
import 'package:words_power/ui/pages/home/home_page.dart';
import 'package:words_power/ui/pages/home/home_view_model.dart';

class HomeProvider extends StatelessWidget {
  const HomeProvider(this.userModel, {super.key});
  final UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return HomeViewModel(userModel);
      },
      child: const HomePage(),
    );
  }
}
