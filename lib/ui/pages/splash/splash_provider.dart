import 'package:words_power/export.dart';
import 'package:words_power/ui/pages/splash/splash_page.dart';
import 'package:words_power/ui/pages/splash/splash_view_model.dart';

class SplashProvider extends StatelessWidget {
  const SplashProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return SplashViewModel();
      },
      child: const SplashPage(),
    );
  }
}
