import 'package:words_power/export.dart';
import 'package:words_power/ui/pages/login/login_view_model.dart';

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
      backgroundColor: AppColors.backgroundColor,
      body: PopScope(
        canPop: vm.isCanPop ?? false,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1.5,
                  child: Image.asset('images/img_login.png'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Text(
                        'GİRİŞ YAP',
                        style: TextStyle(
                          color: AppColors.white,
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
                            isHaveObscure: true,
                            hintText: 'Parola giriniz',
                            onChanged: (String value) {
                              vm.password.value = value.trim();
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            appRoutes.navigateTo(Routes.forgotPassword);
                          },
                          child: Text(
                            'Şifreni mi Unuttun?',
                            style: TextStyle(
                              color: AppColors.greyTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ValueListenableBuilder(
                        valueListenable: vm.isLogin,
                        builder: (_, __, ___) {
                          return CustomButton(
                            title: 'Giriş Yap',
                            onClick: () async {
                              debugPrint('Giriş Yap Tıklandı!!!!');
                              await vm.login();
                              vm.isLogin.value
                                  ? appRoutes.navigateToReplacement(Routes.mainTab)
                                  : showSnackBar(
                                      context,
                                      'Lütfen şifre ve e-mail kontrol edin.',
                                    );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      _buildOrText(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        child: _platformButton(
                          () {},
                          'Sing in with Google',
                          'images/ic_google.png',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: _platformButton(
                          () {},
                          'Sing in with Apple',
                          'images/ic_apple.png',
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'New member? ',
                            style: TextStyle(
                              color: AppColors.whitePorcelain,
                              fontSize: 18,
                            ),
                            children: [
                              TextSpan(
                                text: 'Register Now',
                                style: TextStyle(
                                  color: AppColors.buttonBackground,
                                  fontSize: 20,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    debugPrint('Kayıt Ol Tıklantı');
                                    appRoutes.navigateTo(Routes.register);
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _platformButton(
    VoidCallback onClick,
    String title,
    String iconAddress,
  ) {
    return GestureDetector(
      onTap: () => onClick.call(),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.buttonBackground,
          border: Border.all(
            color: Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.white,
                radius: 14,
                child: Image.asset(iconAddress),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  color: AppColors.white,
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
          child: Divider(color: AppColors.greyTextColor),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'or',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
            ),
          ),
        ),
        Expanded(
          child: Divider(color: AppColors.greyTextColor),
        ),
      ],
    );
  }

  void listeners() {}
}
