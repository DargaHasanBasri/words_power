import '../../../export.dart';
import 'home_page.dart';
import 'home_view_model.dart';

class HomeProvider extends StatelessWidget {
  final String? userName;
  const HomeProvider(this.userName, {super.key});

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
