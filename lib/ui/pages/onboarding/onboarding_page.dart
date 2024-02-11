import 'package:flutter/material.dart';
import 'package:words_power/ui/pages/login/login_provider.dart';
import 'package:words_power/ui/pages/register/register_provider.dart';
import 'package:words_power/ui/widgets/custom_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: Text("Onboarding Page"),
              ),
              const SizedBox(height: 40),
              CustomButton(
                title: "Giriş Yap",
                onClick: () {
                  debugPrint("Giriş Yap Tıklandı!!!!");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginProvider(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),
              CustomButton(
                title: "Kayıt Ol",
                onClick: () {
                  debugPrint("Kayıt Ol Tıklandı!!!!");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterProvider(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
