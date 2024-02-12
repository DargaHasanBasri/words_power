import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:words_power/ui/pages/forgot_password/forgot_password_provider.dart';
import 'package:words_power/ui/pages/onboarding/onboarding_provider.dart';
import 'package:words_power/ui/pages/register/register_provider.dart';
import 'package:words_power/ui/widgets/custom_button.dart';
import 'package:words_power/ui/widgets/custom_textform_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.lightBlue,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 50),
            const Center(
              child: Text(
                "GİRİŞ YAP",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 30),
            CustomTextFormField(
              controller: TextEditingController(),
              hintText: "E-mail adresi giriniz",
              textFieldName: "E-mail Adresi",
              isRequired: true,
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              controller: TextEditingController(),
              hintText: "Parola giriniz",
              textFieldName: "Parola",
              isRequired: true,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgotPasswordProvider(),
                      ),
                    );
                  },
                  child: const Text(
                    "Şifremi Unuttum",
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomButton(
              title: "Giriş Yap",
              onClick: () {
                debugPrint("Kayıt Ol Tıklandı!!!!");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OnboardingProvider(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                "veya",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(
                title: "Google ile Giriş Yap",
                onClick: () {
                  debugPrint("Kayıt Ol Tıklandı!!!!");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OnboardingProvider(),
                    ),
                  );
                },
              ),
            ),
            const Spacer(),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Henüz kayıt olmadın mı? ",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(
                    text: "Kayıt Ol",
                    style: const TextStyle(
                      color: Colors.yellow,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        debugPrint("Giriş Yap Tıklantı");
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
            )
          ],
        ),
      ),
    );
  }
}
