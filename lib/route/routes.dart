import 'package:words_power/export.dart';
import 'package:words_power/ui/pages/detail_post/detail_post_provider.dart';
import 'package:words_power/ui/pages/detail_user/detail_user_provider.dart';
import 'package:words_power/ui/pages/leaderboard/leaderboard_provider.dart';
import 'package:words_power/ui/pages/saved_posts/saved_posts_provider.dart';
import 'package:words_power/ui/pages/user_info/user_info_provider.dart';

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
  static const String personalInformations = 'personalInformationsProvider';
  static const String detailPost = 'detailPostProvider';
  static const String detailUser = 'detailUserProvider';
  static const String savedPosts = 'savedPostsProvider';
  static const String userInfo = 'userInfoProvider';
  static const String leaderboard = 'leaderboardProvider';

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
        final userModel = settings.arguments as UserModel?;
        return MaterialPageRoute(
          builder: (context) => HomeProvider(userModel),
        );
      case Routes.settings:
        final userModel = settings.arguments as UserModel?;
        return MaterialPageRoute(
          builder: (context) => SettingsProvider(userModel),
        );
      case Routes.wordSentenceAdd:
        final userModel = settings.arguments as UserModel?;
        return MaterialPageRoute(
          builder: (context) => WordSentenceAddProvider(userModel),
        );
      case Routes.personalInformations:
        final userModel = settings.arguments as UserModel?;
        return MaterialPageRoute(
          builder: (context) => PersonalInformationsProvider(userModel),
        );
      case Routes.detailPost:
        return MaterialPageRoute(
          builder: (context) => DetailPostProvider(),
        );
      case Routes.detailUser:
        final userID = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (context) => DetailUserProvider(userID),
        );
      case Routes.savedPosts:
        return MaterialPageRoute(
          builder: (context) => SavedPostsProvider(),
        );
      case Routes.userInfo:
        final userModel = settings.arguments as UserModel?;
        return MaterialPageRoute(
          builder: (context) => UserInfoProvider(userModel),
        );
      case Routes.leaderboard:
        return MaterialPageRoute(
          builder: (context) => LeaderboardProvider(),
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
