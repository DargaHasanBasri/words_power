import '../../../export.dart';
import 'package:words_power/ui/pages/main_tab/main_tab_page.dart';
import 'package:words_power/ui/pages/main_tab/main_tab_view_model.dart';

class MainTabProvider extends StatelessWidget {
  const MainTabProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return MainTabViewModel();
      },
      child: const MainTabPage(),
    );
  }
}
