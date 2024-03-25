import '../../../export.dart';
import 'welcome_page.dart';
import 'welcome_view_model.dart';

class WelcomeProvider extends StatelessWidget {
  const WelcomeProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return WelcomeViewModel();
      },
      child: const WelcomePage(),
    );
  }
}
