import 'package:words_power/export.dart';
import 'package:words_power/ui/pages/saved_posts/saved_posts_view_model.dart';

class SavedPostsPage extends StatefulWidget {
  const SavedPostsPage({super.key});

  @override
  State<SavedPostsPage> createState() => _SavedPostsPageState();
}

class _SavedPostsPageState extends BaseStatefulState<SavedPostsPage> {
  late final SavedPostsViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = Provider.of<SavedPostsViewModel>(context, listen: false);
    listeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe6eefa),
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.6,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: CustomColors.white,
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    image: AssetImage('images/bookmark_test.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Örnek Cümle:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Search for your friends on the app and connect with them.'),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      forceMaterialTransparency: true,
      elevation: 0,
      leading: IconButton(
        icon: Image.asset(
          'images/ic_back.png',
          width: 24,
        ),
        onPressed: () {
          appRoutes.popIfBackStackNotEmpty();
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: IconButton(
            icon: Image.asset(
              'images/ic_bookmark.png',
              width: 24,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  void listeners() {}
}
