import '../../../export.dart';
import 'login_page.dart';
import 'login_view_model.dart';

class LoginProvider extends StatelessWidget {
  final bool isCanPop;
  const LoginProvider(this.isCanPop, {super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return LoginViewModel(isCanPop);
      },
      child: const LoginPage(),
    );
  }
}
