import 'package:flutter/material.dart';
import 'package:words_power/base/base_stateful_state.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_textform_field.dart';
import '../onboarding/onboarding_provider.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends BaseStatefulState<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.lightBlue,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 50),
            const Center(
              child: Text(
                "ŞİFREMİ UNUTTUM",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Doğrulama linki alacağınız e-mail adresinizi giriniz...",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              controller: TextEditingController(),
              hintText: "E-mail adresi giriniz",
              textFieldName: "E-mail Adresi",
              isRequired: true,
            ),

            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomButton(
                title: "Gönder",
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
          ],
        ),
      ),
    );
  }
}
