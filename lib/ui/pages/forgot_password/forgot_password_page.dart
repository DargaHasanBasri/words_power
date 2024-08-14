import 'package:words_power/export.dart';
import 'package:words_power/ui/pages/forgot_password/forgot_password_view_model.dart';

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
      appBar: AppBar(
        title: Text(
          'ŞİFREMİ UNUTTUM',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColors.buttonBackground,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50),
              const SizedBox(height: 30),
              AspectRatio(
                aspectRatio: 1,
                child: Image.asset('images/forgot_password.png'),
              ),
              const SizedBox(height: 30),
              Text(
                'Doğrulama Kodu Almak İçin Lütfen Kayıt Olduğunuz E-posta '
                    'Adresinizi Girin',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: vm.controllerMailAddress,
                hintText: 'E-mail adresi giriniz',
                isRequired: true,
                onChanged: (String value) {
                  vm.mailAddress.value = value.trim();
                },
              ),
              const SizedBox(height: 30),
              ValueListenableBuilder(
                valueListenable: vm.mailAddress,
                builder: (_, __, ___) {
                  return CustomButton(
                    title: 'Gönder',
                    onClick: () {
                      debugPrint('Kayıt Ol Tıklandı!!!!');
                      vm.mailAddress.value.isNotEmpty
                          ? appRoutes.navigateTo(Routes.onboarding)
                          : showSnackBar(
                              context,
                              'Lütfen şifre ve e-mail alanlarını kontrol edin. '
                                  'Boş alan bırakmayın!',
                            );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void listeners() {}
}
