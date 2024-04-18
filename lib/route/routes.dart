import 'package:words_power/export.dart';

class Routes {
  const Routes._();
  static const String splash = 'splashProvider';
  static const String welcome = 'welcomeProvider';
  static const String register = 'registerProvider';
  static const String login = 'loginProvider';
  static const String forgotPassword = 'forgotPasswordProvider';
  static const String onboarding = 'onboardingProvider';
  static const String mainTab = 'mainTabProvider';
  static const String home = 'homeProvider';
  static const String settings = 'settingsProvider';
  static const String favorite = 'favoriteProvider';
  static const String wordSentenceAdd = 'wordSentenceAddProvider';
  static const String wordSentenceList = 'wordSentenceListProvider';
  static const String personalInformations = 'personalInformationsProvider';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashProvider(),
        );
      case Routes.welcome:
        return MaterialPageRoute(
          builder: (context) => const WelcomeProvider(),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (context) => const RegisterProvider(),
        );
      case Routes.login:
        final isCanPop = settings.arguments as bool?;
        return MaterialPageRoute(
          builder: (context) => LoginProvider(isCanPop: isCanPop ?? false),
        );
      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordProvider(),
        );
      case Routes.onboarding:
        return MaterialPageRoute(
          builder: (context) => const OnboardingProvider(),
        );
      case Routes.mainTab:
        return MaterialPageRoute(
          builder: (context) => const MainTabProvider(),
        );
      case Routes.home:
        final userName = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (context) => HomeProvider(userName),
        );
      case Routes.settings:
        final userModel = settings.arguments as UserModel?;
        return MaterialPageRoute(
          builder: (context) => SettingsProvider(userModel),
        );
      case Routes.favorite:
        return MaterialPageRoute(
          builder: (context) => const FavoriteProvider(),
        );
      case Routes.wordSentenceAdd:
        final userModel = settings.arguments as UserModel?;
        return MaterialPageRoute(
          builder: (context) => WordSentenceAddProvider(userModel),
        );
      case Routes.wordSentenceList:
        return MaterialPageRoute(
          builder: (context) => const WordSentenceListProvider(),
        );
      case Routes.personalInformations:
        final userModel = settings.arguments as UserModel?;
        return MaterialPageRoute(
          builder: (context) => PersonalInformationsProvider(userModel),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No path for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
