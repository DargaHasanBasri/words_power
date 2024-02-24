import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_power/ui/pages/word_sentence_add/word_sentence_add_page.dart';
import 'package:words_power/ui/pages/word_sentence_add/word_sentence_add_view_model.dart';

class WordSentenceAddProvider extends StatelessWidget {
  const WordSentenceAddProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return WordSentenceAddViewModel();
      },
      child: const WordSentenceAddPage(),
    );
  }
}
