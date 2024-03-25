import '../../../export.dart';
import 'splash_view_model.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends BaseStatefulState<SplashPage> {
  late final SplashViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = Provider.of<SplashViewModel>(context, listen: false);
    localStorage.getInstance();
    waitAndNavigate(context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: CustomColors.backgroundColor,
          ),
        ),
        Positioned.fill(
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: CircleAvatar(
                backgroundColor: CustomColors.buttonBackground,
                radius: 32,
                child: Image.asset("images/logo.png"),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> waitAndNavigate(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    if (localStorage.getString("mail") != null) {
      appRoutes.navigateToReplacement(Routes.mainTab);
    } else {
      appRoutes.navigateToReplacement(Routes.welcome);
    }
  }
}
