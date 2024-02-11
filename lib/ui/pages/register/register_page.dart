import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:words_power/ui/pages/onboarding/onboarding_provider.dart';
import 'package:words_power/ui/widgets/custom_button.dart';
import 'package:words_power/ui/widgets/custom_textform_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
                "Kayıt Ol",
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
            const SizedBox(height: 30),
            getTextPrivacyPolicy(),
            const SizedBox(height: 20),
            CustomButton(
              title: "Kayıt Ol",
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
                text: "Zaten hesabın var mı? ",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(
                    text: "Giriş Yap",
                    style: const TextStyle(
                      color: Colors.yellow,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        debugPrint("Giriş Yap Tıklantı");
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

  Widget getTextPrivacyPolicy() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "Devam ettiğinizde, ",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        children: [
          TextSpan(
            text: "Gizlilik Sözleşmesi ve Kullanım Şartlarını",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                debugPrint("Gizlilik Sözleşmesi ve Kullanım Şartları tıklandı");
              },
          ),
          const TextSpan(
            text: " kabul etmiş olacaksınız.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
