import 'package:flutter/cupertino.dart';
import 'package:words_power/base/base_view_model.dart';

class WordSentenceAddViewModel extends BaseViewModel {
  TextEditingController wordEnglishTextController = TextEditingController();
  TextEditingController wordTurkishTextController = TextEditingController();
  TextEditingController sentenceEnglishTextController = TextEditingController();
  TextEditingController sentenceTurkishTextController = TextEditingController();

  ValueNotifier<String?> wordWriteEnglish = ValueNotifier("");
  ValueNotifier<String?> wordWriteTurkish = ValueNotifier("");
  ValueNotifier<String?> sentenceWriteEnglish = ValueNotifier("");
  ValueNotifier<String?> sentenceWriteTurkish = ValueNotifier("");
}