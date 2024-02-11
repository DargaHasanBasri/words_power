import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_power/ui/pages/register/register_page.dart';
import 'package:words_power/ui/pages/register/register_view_model.dart';

class RegisterProvider extends StatelessWidget {
  const RegisterProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return RegisterViewModel();
      },
      child: const RegisterPage(),
    );
  }
}
