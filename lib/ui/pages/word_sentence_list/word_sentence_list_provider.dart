import '../../../export.dart';
import 'word_sentence_list_page.dart';
import 'word_sentence_list_view_model.dart';

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
