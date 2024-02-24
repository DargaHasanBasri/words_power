import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:words_power/base/base_stateful_state.dart';
import 'package:words_power/ui/pages/word_sentence_add/components/write_area.dart';
import 'package:words_power/ui/pages/word_sentence_add/word_sentence_add_view_model.dart';
import 'package:words_power/ui/widgets/custom_button.dart';
import 'package:words_power/ui/widgets/custom_textform_field.dart';
import 'package:words_power/utils/custom_colors.dart';

class WordSentenceAddPage extends StatefulWidget {
  const WordSentenceAddPage({super.key});

  @override
  State<WordSentenceAddPage> createState() => _WordSentenceAddPageState();
}

class _WordSentenceAddPageState extends BaseStatefulState<WordSentenceAddPage> {
  late final WordSentenceAddViewModel vm;

  @override
  initState() {
    super.initState();
    vm = Provider.of<WordSentenceAddViewModel>(context, listen: false);
    listeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset("images/ic_log_out.png"),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Word & Sentence Add"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  "Word",
                  style: TextStyle(
                    color: CustomColors.whiteSmoke,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 4),
                WriteArea(
                  englishTextController: vm.wordEnglishTextController,
                  turkishTextController: vm.wordTurkishTextController,
                  writeEnglish: vm.wordWriteEnglish,
                  writeTurkish: vm.wordWriteTurkish,
                  titleEnglish: "English Write Word",
                  titleTurkish: "Türkçe Kelime Yaz",
                ),
                const SizedBox(height: 30),
                Text(
                  "Add a picture that reminds you",
                  style: TextStyle(
                    color: CustomColors.whiteSmoke,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 4),
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        image: AssetImage(
                          "images/bookmark_test.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  "Sentence",
                  style: TextStyle(
                    color: CustomColors.whiteSmoke,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 4),
                WriteArea(
                  englishTextController: vm.sentenceEnglishTextController,
                  turkishTextController: vm.sentenceTurkishTextController,
                  writeEnglish: vm.sentenceWriteEnglish,
                  writeTurkish: vm.sentenceWriteTurkish,
                  titleEnglish: "English Write Sentence",
                  titleTurkish: "Türkçe Cümle Yaz",
                ),
                const SizedBox(height: 30),
                Text(
                  "Gemini Generate Example Sentence",
                  style: TextStyle(
                    color: CustomColors.whiteSmoke,
                    fontSize: 16,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: _buildGenerateGemini(),
                ),
                const SizedBox(height: 30),
                CustomButton(
                  onClick: () {},
                  title: "Add",
                  borderRadius: 10,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGenerateGemini() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Material(
        child: InkWell(
          onTap: () {},
          child: Ink(
            decoration: BoxDecoration(
              color: CustomColors.whitePorcelain,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Click me for example sentence",
                style: TextStyle(
                  color: CustomColors.blueCloudBurst,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  listeners() {}
}
