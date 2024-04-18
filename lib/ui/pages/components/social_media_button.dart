import 'package:flutter/material.dart';

import 'package:words_power/utils/custom_colors.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: CustomColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          'G',
          style: TextStyle(
            color: CustomColors.buttonBackground,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
