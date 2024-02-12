import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_power/base/base_stateful_state.dart';
import 'package:words_power/ui/pages/forgot_password/forgot_password_provider.dart';
import 'package:words_power/ui/pages/login/login_view_model.dart';
import 'package:words_power/ui/pages/onboarding/onboarding_provider.dart';
import 'package:words_power/ui/pages/register/register_provider.dart';
import 'package:words_power/ui/widgets/custom_button.dart';
import 'package:words_power/ui/widgets/custom_textform_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseStatefulState<LoginPage> {
  late final LoginViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = Provider.of<LoginViewModel>(context, listen: false);
    listeners();
  }
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
              controller: vm.controllerMailAddress,
              hintText: "E-mail adresi giriniz",
              textFieldName: "E-mail Adresi",
              isRequired: true,
              onChanged: (value) {
                vm.mailAddress.value = value.toString().trim();
              },
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              controller: vm.controllerPassword,
              hintText: "Parola giriniz",
              textFieldName: "Parola",
              isRequired: true,
              onChanged: (value) {
                vm.password.value = value.toString().trim();
              },
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
            ValueListenableBuilder(
              valueListenable: vm.password,
              builder: (_,__,___) {
                return ValueListenableBuilder(
                  valueListenable: vm.mailAddress,
                  builder: (_,__,___) {
                    return CustomButton(
                      title: "Giriş Yap",
                      onClick: () {
                        debugPrint("Kayıt Ol Tıklandı!!!!");
                        vm.isEmpty()
                            ? Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OnboardingProvider(),
                          ),
                        )
                            : showSnackBar(
                            context, "Lütfen şifre ve e-mail alanlarını kontrol edin. Boş alan bırakmayın!");
                      },
                    );
                  }
                );
              }
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

  listeners() {}
}
