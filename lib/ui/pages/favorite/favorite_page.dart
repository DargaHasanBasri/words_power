import '../../../export.dart';
import 'components/favorite_item.dart';
import 'favorite_view_model.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends BaseStatefulState<FavoritePage> {
  late final FavoriteViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = Provider.of<FavoriteViewModel>(context, listen: false);
    listeners();
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
              Text(
                "Words And Sentences Favorite",
                style: TextStyle(
                  fontSize: 22,
                  color: CustomColors.white,
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 80),
                  itemCount: 14,
                  itemBuilder: (context, index) {
                    return const FavoriteItem(
                      word: 'Word and Sentence SentenceSentenceSentence',
                      sentence:
                          'Word and  Sentence Sentence Sentence Sentence Sentence',
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

  listeners() {}
}
