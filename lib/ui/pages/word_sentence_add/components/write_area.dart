import 'package:flutter/material.dart';

import '../../../../utils/custom_colors.dart';
import '../../../widgets/custom_textform_field.dart';

class WriteArea extends StatelessWidget {
  final TextEditingController englishTextController;
  final TextEditingController turkishTextController;
  final ValueNotifier<String?> writeEnglish;
  final ValueNotifier<String?> writeTurkish;
  final String titleEnglish;
  final String titleTurkish;
  const WriteArea(
      {super.key,
      required this.englishTextController,
      required this.turkishTextController,
      required this.writeEnglish,
      required this.writeTurkish,
      required this.titleEnglish,
      required this.titleTurkish});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.whitePorcelain,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.transparent,
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            CustomTextFormField(
              controller: englishTextController,
              hintText: titleEnglish,
              onChanged: (value) {
                writeEnglish.value = value;
              },
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              controller: turkishTextController,
              hintText: titleTurkish,
              onChanged: (value) {
                writeTurkish.value = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
