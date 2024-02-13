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

import '../../../utils/custom_colors.dart';

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
      //resizeToAvoidBottomInset: false,
      backgroundColor: Colors.lightBlue,
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
                ),
              ),
            ),
            AspectRatio(
              aspectRatio: 0.72,
              child: Container(
                decoration: BoxDecoration(
                  color: CustomColors.backgroundColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        const Text(
                          "KAYIT OL",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ValueListenableBuilder(
                          valueListenable: vm.name,
                          builder: (_, __, ___) {
                            return CustomTextFormField(
                              controller: vm.controllerName,
                              hintText: "Adınızı Giriniz",
                              onChanged: (value) {
                                vm.name.value = value.toString().trim();
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        ValueListenableBuilder(
                          valueListenable: vm.surname,
                          builder: (_, __, ___) {
                            return CustomTextFormField(
                              controller: vm.controllerSurname,
                              hintText: "Soyadınızı Giriniz",
                              onChanged: (value) {
                                vm.surname.value = value.toString().trim();
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 20),
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
                                vm.password.value = value;
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 20),
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
                        const SizedBox(height: 20),
                        Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: "Zaten hesabın var mı? ",
                              style: TextStyle(
                                color: CustomColors.greyTextColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                              children: [
                                TextSpan(
                                  text: "Giriş Yap",
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
                                          builder: (context) => const LoginProvider(),
                                        ),
                                      );
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /*
  Padding(
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
   */

  Widget getTextPrivacyPolicy() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "Devam ettiğinizde, ",
        style: TextStyle(
          color: CustomColors.greyTextColor,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        children: [
          TextSpan(
            text: "Gizlilik Sözleşmesi ve Kullanım Şartlarını",
            style: TextStyle(
              color: CustomColors.buttonBackground,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                debugPrint("Gizlilik Sözleşmesi ve Kullanım Şartları tıklandı");
              },
          ),
          TextSpan(
            text: " kabul etmiş olacaksınız.",
            style: TextStyle(
              color: CustomColors.greyTextColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }

  listeners() {}
}
