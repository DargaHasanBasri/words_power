import 'package:words_power/export.dart';
import 'package:words_power/ui/pages/word_sentence_list/components/word_sentence_item.dart';
import 'package:words_power/ui/pages/word_sentence_list/word_sentence_list_view_model.dart';

class WordSentenceListPage extends StatefulWidget {
  const WordSentenceListPage({super.key});

  @override
  State<WordSentenceListPage> createState() => _WordSentenceListPageState();
}

class _WordSentenceListPageState
    extends BaseStatefulState<WordSentenceListPage> {
  late final WordSentenceListViewModel vm;

  @override
  void initState() {
    vm = Provider.of<WordSentenceListViewModel>(context, listen: false);
    vm.getWordsAndSentences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: CustomColors.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearch(),
              const SizedBox(height: 24),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: vm.wordsAndSentences,
                  builder: (_, __, ___) {
                    return StreamBuilder<List<WordAndSentenceModel>>(
                        stream: vm.wordsAndSentences.value,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return Center(child: Text('No data available'));
                          } else {
                            final wordsAndSentences = snapshot.data!;
                            return ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              padding: const EdgeInsets.only(bottom: 80),
                              itemCount: wordsAndSentences.length,
                              itemBuilder: (context, index) {
                                final item = wordsAndSentences[index];
                                return WordSentenceListItem(
                                  word: item.wordTurkish ?? '',
                                  sentence: item.sentenceEnglish ?? '',
                                  imageAddress: 'images/bookmark_test.png',
                                  whoPersonWrote: item.authorName ?? '',
                                  numberViews: item.views.toString(),
                                  dateAdded: '00-00-0000',
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const SizedBox(height: 20),
                            );
                          }
                        });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Words And Sentences',
          style: TextStyle(
            fontSize: 22,
            color: CustomColors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            'images/ic_favorite.png',
            width: 40,
          ),
        ),
      ],
    );
  }
}
