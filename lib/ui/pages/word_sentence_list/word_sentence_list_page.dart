import 'package:flutter/material.dart';
import 'package:words_power/base/base_stateful_state.dart';
import 'package:words_power/utils/custom_colors.dart';

class WordSentenceListPage extends StatefulWidget {
  const WordSentenceListPage({super.key});

  @override
  State<WordSentenceListPage> createState() => _WordSentenceListPageState();
}

class _WordSentenceListPageState extends BaseStatefulState<WordSentenceListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: Column(
        children: [],
      ),
    );
  }
}
