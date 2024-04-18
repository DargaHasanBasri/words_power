import 'package:words_power/export.dart';
import 'package:words_power/ui/pages/login/login_page.dart';
import 'package:words_power/ui/pages/login/login_view_model.dart';

class LoginProvider extends StatelessWidget {
  const LoginProvider({required this.isCanPop, super.key});
  final bool? isCanPop;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return LoginViewModel(isCanPop: isCanPop);
      },
      child: const LoginPage(),
    );
  }
}
