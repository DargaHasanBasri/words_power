import 'package:flutter/cupertino.dart';
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
      backgroundColor: CustomColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1.5,
                  child: Image.asset("images/img_login.png"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
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
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ForgotPasswordProvider(),
                            ),
                          );
                        },
                        child: Text(
                          "Şifreni mi Unuttun?",
                          style: TextStyle(
                            color: CustomColors.greyTextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
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
                            : showSnackBar(context,
                                "Lütfen şifre ve e-mail kontrol edin.");
                      },
                    );
                  },
                ),
                const SizedBox(height: 20),
                _buildOrText(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: _platformButton(
                    () {},
                    "Sing in with Google",
                    "images/ic_google.png",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: _platformButton(
                    () {},
                    "Sing in with Apple",
                    "images/ic_apple.png",
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const RegisterProvider(),
                      ),
                    );
                  },
                  child: Text(
                    "New Member? Register now",
                    style: TextStyle(
                      color: CustomColors.whitePorcelain,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _platformButton(Function onClick, String title, String iconAddress) {
    return GestureDetector(
      onTap: () => onClick.call(),
      child: Container(
        decoration: BoxDecoration(
          color: CustomColors.buttonBackground,
          border: Border.all(
            color: Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: CustomColors.white,
                radius: 14,
                child: Image.asset(iconAddress),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  color: CustomColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(color: CustomColors.greyTextColor),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "or",
            style: TextStyle(
              color: CustomColors.white,
              fontSize: 16,
            ),
          ),
        ),
        Expanded(
          child: Divider(color: CustomColors.greyTextColor),
        ),
      ],
    );
  }

  listeners() {}
}
