import 'package:words_power/export.dart';
import 'package:words_power/ui/pages/forgot_password/forgot_password_page.dart';
import 'package:words_power/ui/pages/forgot_password/forgot_password_view_model.dart';

class ForgotPasswordProvider extends StatelessWidget {
  const ForgotPasswordProvider({super.key});

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
