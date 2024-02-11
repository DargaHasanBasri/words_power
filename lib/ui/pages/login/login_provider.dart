import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_power/ui/pages/login/login_page.dart';
import 'package:words_power/ui/pages/login/login_view_model.dart';

class LoginProvider extends StatelessWidget {
  const LoginProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return LoginViewModel();
      },
      child: const LoginPage(),
    );
  }
}
