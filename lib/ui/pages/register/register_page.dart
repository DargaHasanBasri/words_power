import 'package:words_power/export.dart';

import 'package:words_power/ui/pages/register/register_view_model.dart';

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
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1.2,
                child: Image.asset('images/img_register.png'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      const Text(
                        'KAYIT OL',
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
                            hintText: 'Kullanıcı Adı Giriniz',
                            onChanged: (String value) {
                              vm.name.value = value.trim();
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
                            hintText: 'E-mail adresi giriniz',
                            onChanged: (String value) {
                              vm.mailAddress.value = value.trim();
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
                            hintText: 'Parola giriniz',
                            isHaveObscure: true,
                            onChanged: (String value) {
                              vm.password.value = value;
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      getTextPrivacyPolicy(),
                      const SizedBox(height: 20),
                      CustomButton(
                        title: 'Kayıt Ol',
                        onClick: () async {
                          debugPrint('Kayıt Ol Tıklandı!!!!');
                          final userModel = UserModel(
                            email: vm.mailAddress.value,
                            name: vm.name.value,
                            password: vm.password.value,
                          );
                          await vm.register();
                          await userInfo.saveUserInfoToFirebase(userModel);
                          vm.isRegister.value
                              ? appRoutes.navigateTo(
                                  Routes.login,
                                  arguments: true,
                                )
                              : showSnackBar(context, 'Boş alan bırakmayın!');
                        },
                      ),
                      const SizedBox(height: 14),
                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'Zaten hesabın var mı? ',
                            style: TextStyle(
                              color: AppColors.whitePorcelain,
                              fontSize: 18,
                            ),
                            children: [
                              TextSpan(
                                text: 'Giriş Yap',
                                style: TextStyle(
                                  color: AppColors.buttonBackground,
                                  fontSize: 20,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    debugPrint('Giriş Yap Tıklantı');
                                    appRoutes.navigateTo(
                                      Routes.login,
                                      arguments: true,
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
        text: 'Devam ettiğinizde, ',
        style: TextStyle(
          color: AppColors.greyTextColor,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        children: [
          TextSpan(
            text: 'Gizlilik Sözleşmesi ve Kullanım Şartlarını',
            style: TextStyle(
              color: AppColors.buttonBackground,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                debugPrint('Gizlilik Sözleşmesi ve Kullanım Şartları tıklandı');
                DialogHelper.exit(context);
              },
          ),
          TextSpan(
            text: ' kabul etmiş olacaksınız.',
            style: TextStyle(
              color: AppColors.greyTextColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  void listeners() {}
}
