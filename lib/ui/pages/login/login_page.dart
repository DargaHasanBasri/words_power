import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_power/base/base_stateful_state.dart';
import 'package:words_power/ui/pages/forgot_password/forgot_password_provider.dart';
import 'package:words_power/ui/pages/home/home_provider.dart';
import 'package:words_power/ui/pages/login/login_view_model.dart';
import 'package:words_power/ui/pages/onboarding/onboarding_provider.dart';
import 'package:words_power/ui/pages/register/register_provider.dart';
import 'package:words_power/ui/widgets/custom_button.dart';
import 'package:words_power/ui/widgets/custom_textform_field.dart';

import '../../../utils/custom_colors.dart';

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
      //resizeToAvoidBottomInset: false,
      backgroundColor: CustomColors.backgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("images/background.png"),
                fit: BoxFit.cover,
              )),
            ),
            AspectRatio(
              aspectRatio: 0.9,
              child: Container(
                decoration: BoxDecoration(
                  color: CustomColors.backgroundColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      const Text(
                        "GİRİŞ YAP",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 24),
                      ValueListenableBuilder(
                        valueListenable: vm.mailAddress,
                        builder: (_, __, ___) {
                          return CustomTextFormField(
                            controller: vm.controllerMailAddress,
                            hintText: "E-mail adresi giriniz",
                            onChanged: (value) {
                              vm.mailAddress.value = value.toString().trim();
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      ValueListenableBuilder(
                        valueListenable: vm.password,
                        builder: (_, __, ___) {
                          return CustomTextFormField(
                            controller: vm.controllerPassword,
                            hintText: "Parola giriniz",
                            onChanged: (value) {
                              vm.password.value = value.toString().trim();
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      ValueListenableBuilder(
                        valueListenable: vm.isLogin,
                        builder: (_, __, ___) {
                          return CustomButton(
                            title: "Giriş Yap",
                            onClick: () async {
                              debugPrint("Kayıt Ol Tıklandı!!!!");
                              await vm.login();
                              vm.isLogin.value
                                  ? Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const HomeProvider(),
                                      ),
                                    )
                                  : showSnackBar(context, "Lütfen şifre ve e-mail kontrol edin.");
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgotPasswordProvider(),
                            ),
                          );
                        },
                        child: Text(
                          "Şifreni mi Unuttun?",
                          style: TextStyle(
                            color: CustomColors.greyTextColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Henüz kayıt olmadın mı? ",
                            style: TextStyle(
                              color: CustomColors.greyTextColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
                              TextSpan(
                                text: "Kayıt Ol",
                                style: TextStyle(
                                  color: CustomColors.buttonBackground,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
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
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  listeners() {}
}

/*
SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                  ValueListenableBuilder(
                    valueListenable: vm.password,
                    builder: (_, __, ___) {
                      return CustomTextFormField(
                        controller: vm.controllerPassword,
                        hintText: "Parola giriniz",
                        textFieldName: "Parola",
                        isRequired: true,
                        onChanged: (value) {
                          vm.password.value = value.toString().trim();
                        },
                      );
                    },
                  ),
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
                  ValueListenableBuilder(
                    valueListenable: vm.isLogin,
                    builder: (_, __, ___) {
                      return CustomButton(
                        title: "Giriş Yap",
                        onClick: () async {
                          debugPrint("Kayıt Ol Tıklandı!!!!");
                          await vm.login();
                          vm.isLogin.value
                              ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeProvider(),
                            ),
                          )
                              : showSnackBar(context, "Lütfen şifre ve e-mail kontrol edin.");
                        },
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
          ),
 */
