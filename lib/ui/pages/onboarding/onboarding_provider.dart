import 'package:words_power/export.dart';
import 'package:words_power/ui/pages/onboarding/onboarding_page.dart';
import 'package:words_power/ui/pages/onboarding/onboarding_view_model.dart';

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
