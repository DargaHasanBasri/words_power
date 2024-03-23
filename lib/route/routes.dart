import 'package:flutter/material.dart';
import 'package:words_power/ui/pages/favorite/favorite_provider.dart';
import 'package:words_power/ui/pages/forgot_password/forgot_password_provider.dart';
import 'package:words_power/ui/pages/home/home_provider.dart';
import 'package:words_power/ui/pages/login/login_provider.dart';
import 'package:words_power/ui/pages/main_tab/main_tab_provider.dart';
import 'package:words_power/ui/pages/onboarding/onboarding_provider.dart';
import 'package:words_power/ui/pages/register/register_provider.dart';
import 'package:words_power/ui/pages/settings/settings_provider.dart';
import 'package:words_power/ui/pages/welcome/welcome_provider.dart';
import 'package:words_power/ui/pages/word_sentence_add/word_sentence_add_provider.dart';
import 'package:words_power/ui/pages/word_sentence_list/word_sentence_list_provider.dart';

import '../models/user_model.dart';
import '../ui/pages/splash/splash_provider.dart';

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

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashProvider());
      case Routes.welcome:
        return MaterialPageRoute(builder: (context) => const WelcomeProvider());
      case Routes.register:
        return MaterialPageRoute(
            builder: (context) => const RegisterProvider());
      case Routes.login:
        bool? isCanPop = settings.arguments as bool?;
        return MaterialPageRoute(
          builder: (context) => LoginProvider(isCanPop ?? false),
        );
      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordProvider(),
        );
      case Routes.onboarding:
        return MaterialPageRoute(
            builder: (context) => const OnboardingProvider());
      case Routes.mainTab:
        return MaterialPageRoute(
          builder: (context) => const MainTabProvider(),
        );
      case Routes.home:
        String? userName = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (context) => HomeProvider(userName),
        );
      case Routes.settings:
        UserModel? userModel = settings.arguments as UserModel?;
        return MaterialPageRoute(
          builder: (context) => SettingsProvider(userModel),
        );
      case Routes.favorite:
        return MaterialPageRoute(
          builder: (context) => const FavoriteProvider(),
        );
      case Routes.wordSentenceAdd:
        UserModel? userModel = settings.arguments as UserModel?;
        return MaterialPageRoute(
          builder: (context) => WordSentenceAddProvider(userModel),
        );
      case Routes.wordSentenceList:
        return MaterialPageRoute(
          builder: (context) => const WordSentenceListProvider(),
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
