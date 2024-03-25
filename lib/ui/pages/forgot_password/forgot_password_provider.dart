import '../../../export.dart';
import 'forgot_password_page.dart';
import 'forgot_password_view_model.dart';

class ForgotPasswordProvider extends StatelessWidget {
  const ForgotPasswordProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return ForgotPasswordViewModel();
      },
      child: const ForgotPasswordPage(),
    );
  }
}
