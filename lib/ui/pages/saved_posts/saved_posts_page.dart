import 'dart:ui';

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
        padding: const EdgeInsets.only(
          bottom: kBottomNavigationBarHeight,
          left: 14,
          right: 14,
        ),
        child: GridView.builder(
          itemCount: 12,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            return Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('images/bookmark_test.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff37638d).withOpacity(0.4),
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            SizedBox(width: 14),
                            Image.asset('images/ic_like.png'),
                            SizedBox(width: 6),
                            Text(
                              '10',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Spacer(),
                            Image.asset('images/ic_save.png'),
                            SizedBox(width: 14),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
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
