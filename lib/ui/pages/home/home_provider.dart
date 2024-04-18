import 'package:words_power/export.dart';
import 'package:words_power/ui/pages/home/home_page.dart';
import 'package:words_power/ui/pages/home/home_view_model.dart';

class HomeProvider extends StatelessWidget {
  const HomeProvider(this.userName, {super.key});
  final String? userName;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return HomeViewModel(userName);
      },
      child: const HomePage(),
    );
  }
}
