import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_power/base/base_stateful_state.dart';
import 'package:words_power/ui/pages/forgot_password/forgot_password_view_model.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_textform_field.dart';
import '../onboarding/onboarding_provider.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends BaseStatefulState<ForgotPasswordPage> {
  late final ForgotPasswordViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = Provider.of<ForgotPasswordViewModel>(context, listen: false);
    listeners();
  }

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
              controller: vm.controllerMailAddress,
              hintText: "E-mail adresi giriniz",
              textFieldName: "E-mail Adresi",
              isRequired: true,
              onChanged: (value) {
                vm.mailAddress.value = value.toString().trim();
              },
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ValueListenableBuilder(
                  valueListenable: vm.mailAddress,
                  builder: (_, __, ___) {
                    return CustomButton(
                      title: "Gönder",
                      onClick: () {
                        debugPrint("Kayıt Ol Tıklandı!!!!");
                        vm.mailAddress.value.isNotEmpty
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
                  }),
            ),
          ],
        ),
      ),
    );
  }

  listeners() {}
}
