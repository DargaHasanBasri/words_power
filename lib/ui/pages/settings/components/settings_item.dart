import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    required this.title,
    required this.iconAddress,
    required this.onClick,
    super.key,
  });
  final String title;
  final String iconAddress;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick.call,
      child: SizedBox(
        height: 40,
        child: Row(
          children: [
            Image.asset(
              iconAddress,
              width: 40,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
