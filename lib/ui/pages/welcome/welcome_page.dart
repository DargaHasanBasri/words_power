import 'package:flutter/material.dart';
import 'package:words_power/export.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends BaseStatefulState<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor.withOpacity(0.6),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 0.8,
              child: FadedWidget(
                child: Image.asset(
                  'images/welcome2.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            CircleAvatar(
              backgroundColor: CustomColors.buttonBackground,
              radius: 32,
              child: Image.asset('images/logo.png'),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Words-Power',
                style: TextStyle(
                  color: CustomColors.whiteSmoke,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 50,
              ),
              child: Column(
                children: [
                  CustomButton(
                    onClick: () {
                      appRoutes.navigateTo(Routes.login);
                    },
                    title: 'Login',
                    backgroundColor: CustomColors.buttonBackground,
                  ),
                  const SizedBox(height: 14),
                  CustomButton(
                    onClick: () {
                      appRoutes.navigateTo(Routes.register);
                    },
                    title: 'Register',
                    titleColor: CustomColors.blueCloudBurst,
                    backgroundColor: CustomColors.whiteSmoke,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
