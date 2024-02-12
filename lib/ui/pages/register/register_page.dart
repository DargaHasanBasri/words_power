import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_power/base/base_stateful_state.dart';
import 'package:words_power/models/user_model.dart';
import 'package:words_power/ui/pages/login/login_provider.dart';
import 'package:words_power/ui/pages/onboarding/onboarding_provider.dart';
import 'package:words_power/ui/pages/register/register_view_model.dart';
import 'package:words_power/ui/widgets/custom_button.dart';
import 'package:words_power/ui/widgets/custom_textform_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseStatefulState<RegisterPage> {
  late final RegisterViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = Provider.of<RegisterViewModel>(context, listen: false);
    listeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.lightBlue,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              const Center(
                child: Text(
                  "KAYIT OL",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ValueListenableBuilder(
                valueListenable: vm.name,
                builder: (_, __, ___) {
                  return CustomTextFormField(
                    controller: vm.controllerName,
                    hintText: "Adınızı Giriniz",
                    textFieldName: "Ad",
                    isRequired: true,
                    onChanged: (value) {
                      vm.name.value = value.toString().trim();
                    },
                  );
                },
              ),
              const SizedBox(height: 10),
              ValueListenableBuilder(
                valueListenable: vm.surname,
                builder: (_, __, ___) {
                  return CustomTextFormField(
                    controller: vm.controllerSurname,
                    hintText: "Soyadınızı Giriniz",
                    textFieldName: "Soyad",
                    isRequired: true,
                    onChanged: (value) {
                      vm.surname.value = value.toString().trim();
                    },
                  );
                },
              ),
              const SizedBox(height: 10),
              ValueListenableBuilder(
                valueListenable: vm.mailAddress,
                builder: (_, __, ___) {
                  return CustomTextFormField(
                    controller: vm.controllerMailAddress,
                    hintText: "E-mail adresi giriniz",
                    textFieldName: "E-mail Adresi",
                    isRequired: true,
                    onChanged: (value) {
                      vm.mailAddress.value = value.toString().trim();
                    },
                  );
                },
              ),
              const SizedBox(height: 10),
              ValueListenableBuilder(
                valueListenable: vm.password,
                builder: (_, __, ___) {
                  return CustomTextFormField(
                    controller: vm.controllerPassword,
                    hintText: "Parola giriniz",
                    textFieldName: "Parola",
                    isRequired: true,
                    onChanged: (value) {
                      vm.password.value = value;
                    },
                  );
                },
              ),
              const SizedBox(height: 30),
              getTextPrivacyPolicy(),
              const SizedBox(height: 20),
              CustomButton(
                  title: "Kayıt Ol",
                  onClick: () async {
                    debugPrint("Kayıt Ol Tıklandı!!!!");
                    UserModel userModel = UserModel(
                      email: vm.mailAddress.value,
                      name: vm.name.value,
                      password: vm.password.value,
                      surname: vm.surname.value,
                    );
                    await vm.register(userModel);
                    vm.isRegister.value
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginProvider(),
                            ),
                          )
                        : showSnackBar(context, "Boş alan bırakmayın!");
                  }),
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: RichText(
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginProvider(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
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

  listeners() {}
}
