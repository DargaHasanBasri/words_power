import 'package:words_power/export.dart';
import 'package:words_power/ui/pages/word_sentence_add/word_sentence_add_page.dart';
import 'package:words_power/ui/pages/word_sentence_add/word_sentence_add_view_model.dart';

class WordSentenceAddProvider extends StatelessWidget {
  const WordSentenceAddProvider(this.userModel, {super.key});
  final UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return WordSentenceAddViewModel(userModel);
      },
      child: const WordSentenceAddPage(),
    );
  }
}
