import 'package:words_power/export.dart';
import 'package:words_power/ui/pages/saved_posts/saved_posts_page.dart';
import 'package:words_power/ui/pages/saved_posts/saved_posts_view_model.dart';

class SavedPostsProvider extends StatelessWidget {
  const SavedPostsProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return SavedPostsViewModel();
      },
      child: const SavedPostsPage(),
    );
  }
}
