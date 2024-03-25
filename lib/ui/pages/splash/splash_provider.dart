import '../../../export.dart';
import 'splash_page.dart';
import 'splash_view_model.dart';

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
