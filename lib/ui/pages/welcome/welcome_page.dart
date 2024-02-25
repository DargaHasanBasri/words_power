import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:words_power/base/base_stateful_state.dart';
import 'package:words_power/ui/pages/login/login_provider.dart';
import 'package:words_power/ui/pages/register/register_provider.dart';
import 'package:words_power/ui/widgets/custom_button.dart';
import 'package:words_power/utils/custom_colors.dart';

import '../../widgets/faded_widget.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 0.8,
            child: FadedWidget(
              child: Image.asset(
                "images/welcome2.png",
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: CustomColors.buttonBackground,
            radius: 32,
            child: Image.asset("images/logo.png"),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              "Words-Power",
              style: TextStyle(
                color: CustomColors.whiteSmoke,
                fontSize: 22,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CustomButton(
              onClick: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginProvider(),
                  ),
                );
              },
              title: "Login",
              backgroundColor: CustomColors.buttonBackground,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: CustomButton(
              onClick: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterProvider(),
                  ),
                );
              },
              title: "Register",
              titleColor: CustomColors.blueCloudBurst,
              backgroundColor: CustomColors.whiteSmoke,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
