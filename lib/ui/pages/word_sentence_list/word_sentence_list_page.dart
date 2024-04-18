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
    vm.subscribeToData();
    super.initState();
  }

  @override
  void dispose() {
    vm.subscription.cancel();
    vm.wordAndSentenceListNotifier.dispose();
    super.dispose();
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
                  valueListenable: vm.wordAndSentenceListNotifier,
                  builder: (_, __, ___) {
                    return ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(bottom: 80),
                      itemCount:
                          vm.wordAndSentenceListNotifier.value?.length ?? 0,
                      itemBuilder: (context, index) {
                        return WordSentenceListItem(
                          word: vm.wordAndSentenceListNotifier.value?[index]
                                  .wordEnglish ??
                              '',
                          sentence: vm.wordAndSentenceListNotifier.value?[index]
                                  .sentenceEnglish ??
                              '',
                          imageAddress: 'images/bookmark_test.png',
                          whoPersonWrote: vm.wordAndSentenceListNotifier
                                  .value?[index].authorName ??
                              '',
                          numberViews: vm.wordAndSentenceListNotifier
                                  .value?[index].views
                                  .toString() ??
                              '0',
                          dateAdded: '00-00-0000',
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(height: 20),
                    );
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
