import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_power/ui/pages/welcome/welcome_page.dart';
import 'package:words_power/ui/pages/welcome/welcome_view_model.dart';

class WelcomeProvider extends StatelessWidget {
  const WelcomeProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return WelcomeViewModel();
      },
      child: const WelcomePage(),
    );
  }
}
