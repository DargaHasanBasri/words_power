import 'package:words_power/base/base_view_model.dart';
import 'package:words_power/export.dart';

class WordSentenceAddViewModel extends BaseViewModel {
  WordSentenceAddViewModel(this.userModel);
  final UserModel? userModel;

  TextEditingController wordEnglishTextController = TextEditingController();
  TextEditingController wordTurkishTextController = TextEditingController();
  TextEditingController sentenceEnglishTextController = TextEditingController();
  TextEditingController sentenceTurkishTextController = TextEditingController();

  ValueNotifier<String?> wordWriteEnglish = ValueNotifier('');
  ValueNotifier<String?> wordWriteTurkish = ValueNotifier('');
  ValueNotifier<String?> sentenceWriteEnglish = ValueNotifier('');
  ValueNotifier<String?> sentenceWriteTurkish = ValueNotifier('');
  ValueNotifier<XFile?> image = ValueNotifier(null);

  Future<void> pickImage(ImageSource imageSource) async {
    image.value = await Utility().pickImageFromGallery(imageSource);
  }

  void addWordAndSentence(WordAndSentenceModel wordAndSentenceModel) {
    WordAndSentenceAddRepository(fireBaseFirestore)
        .addWordAndSentence(wordAndSentenceModel);
  }
}
