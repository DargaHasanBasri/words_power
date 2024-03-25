import '../../../export.dart';
import 'word_sentence_add_page.dart';
import 'word_sentence_add_view_model.dart';

class WordSentenceAddProvider extends StatelessWidget {
  final UserModel? userModel;
  const WordSentenceAddProvider(this.userModel, {super.key});

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
