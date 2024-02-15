import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_power/base/base_stateful_state.dart';
import 'package:words_power/ui/pages/forgot_password/forgot_password_provider.dart';
import 'package:words_power/ui/pages/login/login_view_model.dart';
import 'package:words_power/ui/pages/main_tab/main_tab_provider.dart';
import 'package:words_power/ui/pages/register/register_provider.dart';
import 'package:words_power/ui/widgets/custom_button.dart';
import 'package:words_power/ui/widgets/custom_textform_field.dart';

import '../../../utils/custom_colors.dart';
import '../components/social_media_button.dart';

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
      body: Stack(
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
            aspectRatio: 1,
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
                      const SizedBox(height: 20),
                      Text(
                        "GİRİŞ YAP",
                        style: TextStyle(
                          color: CustomColors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
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
                            isHaveObscure: true,
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
                                        builder: (context) => const MainTabProvider(),
                                      ),
                                    )
                                  : showSnackBar(context, "Lütfen şifre ve e-mail kontrol edin.");
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
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
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialMediaButton(),
                          SizedBox(width: 20),
                          SocialMediaButton(),
                        ],
                      ),
                      const SizedBox(height: 10),
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
          ),
        ],
      ),
    );
  }

  listeners() {}
}
