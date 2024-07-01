import 'dart:async';

import 'package:words_power/base/base_view_model.dart';
import 'package:words_power/export.dart';

class WordSentenceListViewModel extends BaseViewModel {
  ValueNotifier<Stream<List<WordAndSentenceModel>>> wordsAndSentences =
      ValueNotifier(Stream.empty());

  Future<void> getWordsAndSentences() async {
    wordsAndSentences.value = await repository.getProducts();
  }
}
