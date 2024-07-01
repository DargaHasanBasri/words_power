import 'package:words_power/base/base_view_model.dart';
import 'package:words_power/export.dart';

class WordSentenceAddViewModel extends BaseViewModel {
  WordSentenceAddViewModel(this.userModel);
  final UserModel? userModel;

  final uid = const Uuid().v4();
  ValueNotifier<String?> wordWriteEnglish = ValueNotifier('');
  ValueNotifier<String?> wordWriteTurkish = ValueNotifier('');
  ValueNotifier<String?> sentenceWriteEnglish = ValueNotifier('');
  ValueNotifier<String?> sentenceWriteTurkish = ValueNotifier('');
  ValueNotifier<XFile?> image = ValueNotifier(null);
  ValueNotifier<WordAndSentenceModel> wordAndSentenceModelNotifier =
      ValueNotifier(WordAndSentenceModel());

  bool isImgPathNull() {
    if (image.value != null) return true;
    return false;
  }

  Future<void> pickImage(ImageSource imageSource) async {
    image.value = await Utility().pickImageFromGallery(imageSource);
  }

  Future<void> addWordAndSentence(
      WordAndSentenceModel wordAndSentenceModel) async {
    WordAndSentenceAddRepository(fireBaseFirestore)
        .addWordAndSentence(wordAndSentenceModel);
  }
}
