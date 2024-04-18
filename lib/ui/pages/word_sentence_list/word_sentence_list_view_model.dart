import 'dart:async';

import 'package:words_power/base/base_view_model.dart';
import 'package:words_power/export.dart';

class WordSentenceListViewModel extends BaseViewModel {
  ValueNotifier<List<WordAndSentenceModel>?> wordAndSentenceListNotifier =
      ValueNotifier([]);

  late final StreamSubscription<dynamic> subscription;

  void subscribeToData() {
    subscription = fireBaseFirestore
        .collection('wordAndSentence')
        .snapshots()
        .listen((snapshot) {
      final list = snapshot.docs
          .map((doc) => WordAndSentenceModel.fromMap(doc.data()))
          .toList();
      wordAndSentenceListNotifier.value = list;

      for (final item in list) {
        debugPrint('Word: ${item.wordEnglish}');
        debugPrint('Sentence: ${item.sentenceEnglish}');
        debugPrint('Author: ${item.authorName}');
        debugPrint('Views: ${item.views}');
        debugPrint('Created At: ${item.createdAt}');
        debugPrint('-----------------------');
      }
    });
  }
}
