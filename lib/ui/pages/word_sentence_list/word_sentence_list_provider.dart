import 'package:words_power/export.dart';
import 'package:words_power/ui/pages/word_sentence_list/word_sentence_list_page.dart';
import 'package:words_power/ui/pages/word_sentence_list/word_sentence_list_view_model.dart';

class WordSentenceListProvider extends StatelessWidget {
  const WordSentenceListProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return WordSentenceListViewModel();
      },
      child: const WordSentenceListPage(),
    );
  }
}
