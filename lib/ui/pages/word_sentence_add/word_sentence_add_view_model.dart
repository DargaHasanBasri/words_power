import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:words_power/base/base_view_model.dart';
import 'package:words_power/utils/utility.dart';

import '../../../models/user_model.dart';
import '../../../models/word_and_sentence_model.dart';
import '../../../repository/word_sentence_add_repository.dart';

class WordSentenceAddViewModel extends BaseViewModel {
  final UserModel? userModel;
  WordSentenceAddViewModel(this.userModel);

  TextEditingController wordEnglishTextController = TextEditingController();
  TextEditingController wordTurkishTextController = TextEditingController();
  TextEditingController sentenceEnglishTextController = TextEditingController();
  TextEditingController sentenceTurkishTextController = TextEditingController();

  ValueNotifier<String?> wordWriteEnglish = ValueNotifier("");
  ValueNotifier<String?> wordWriteTurkish = ValueNotifier("");
  ValueNotifier<String?> sentenceWriteEnglish = ValueNotifier("");
  ValueNotifier<String?> sentenceWriteTurkish = ValueNotifier("");
  ValueNotifier<XFile?> image = ValueNotifier(null);

  void pickImage(ImageSource imageSource) async {
    image.value = await Utility().pickImageFromGallery(imageSource);
  }

  void addWordAndSentence(WordAndSentenceModel wordAndSentenceModel) {
    WordAndSentenceAddRepository(fireBaseFirestore).addWordAndSentence(wordAndSentenceModel);
  }
}
