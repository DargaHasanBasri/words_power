import '../../../export.dart';
import 'components/word_sentence_item.dart';

class WordSentenceListPage extends StatefulWidget {
  const WordSentenceListPage({super.key});

  @override
  State<WordSentenceListPage> createState() => _WordSentenceListPageState();
}

class _WordSentenceListPageState
    extends BaseStatefulState<WordSentenceListPage> {
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
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 80),
                  itemCount: 14,
                  itemBuilder: (context, index) {
                    return const WordSentenceListItem(
                      word: 'Word and Sentence',
                      sentence: 'Word and Sentence',
                      imageAddress: "images/bookmark_test.png",
                      whoPersonWrote: 'testDeveloper',
                      numberViews: '2343',
                      dateAdded: '2 days ago',
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: 20),
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
          "Words And Sentences",
          style: TextStyle(
            fontSize: 22,
            color: CustomColors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            "images/ic_favorite.png",
            width: 40,
          ),
        ),
      ],
    );
  }
}
