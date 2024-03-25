import '../../../export.dart';
import 'onboarding_page.dart';
import 'onboarding_view_model.dart';

class OnboardingProvider extends StatelessWidget {
  const OnboardingProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return OnboardingViewModel();
      },
      child: const OnboardingPage(),
    );
  }
}
