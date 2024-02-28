import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_power/base/base_stateful_state.dart';
import 'package:words_power/models/user_model.dart';
import 'package:words_power/ui/pages/login/login_provider.dart';
import 'package:words_power/ui/pages/register/register_view_model.dart';
import 'package:words_power/ui/widgets/custom_button.dart';
import 'package:words_power/ui/widgets/custom_textform_field.dart';

import '../../../utils/custom_colors.dart';
import '../../../utils/dialog_helper.dart';

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
      backgroundColor: CustomColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1.2,
                child: Image.asset("images/img_register.png"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SingleChildScrollView(
                  child: Column(
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
                            hintText: "Kullanıcı Adı Giriniz",
                            onChanged: (value) {
                              vm.name.value = value.toString().trim();
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
                            isHaveObscure: true,
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
                            );
                            await vm.register();
                            userInfo.saveUserInfoToFirebase(userModel);
                            vm.isRegister.value
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginProvider(true),
                                    ),
                                  )
                                : showSnackBar(context, "Boş alan bırakmayın!");
                          }),
                      const SizedBox(height: 14),
                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Zaten hesabın var mı? ",
                            style: TextStyle(
                              color: CustomColors.whitePorcelain,
                              fontSize: 18,
                            ),
                            children: [
                              TextSpan(
                                text: "Giriş Yap",
                                style: TextStyle(
                                  color: CustomColors.buttonBackground,
                                  fontSize: 20,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    debugPrint("Giriş Yap Tıklantı");
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginProvider(true),
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
        style: TextStyle(
          color: CustomColors.greyTextColor,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        children: [
          TextSpan(
            text: "Gizlilik Sözleşmesi ve Kullanım Şartlarını",
            style: TextStyle(
              color: CustomColors.buttonBackground,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                debugPrint("Gizlilik Sözleşmesi ve Kullanım Şartları tıklandı");
                DialogHelper.exit(context);
              },
          ),
          TextSpan(
            text: " kabul etmiş olacaksınız.",
            style: TextStyle(
              color: CustomColors.greyTextColor,
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
