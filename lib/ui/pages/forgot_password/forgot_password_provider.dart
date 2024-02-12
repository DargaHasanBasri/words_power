import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_power/ui/pages/forgot_password/forgot_password_page.dart';
import 'package:words_power/ui/pages/forgot_password/forgot_password_view_model.dart';

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
