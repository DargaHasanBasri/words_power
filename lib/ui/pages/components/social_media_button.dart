import 'package:flutter/material.dart';

import 'package:words_power/utils/app_colors.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          'G',
          style: TextStyle(
            color: AppColors.buttonBackground,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
