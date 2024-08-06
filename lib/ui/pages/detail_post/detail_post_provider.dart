import 'package:words_power/export.dart';
import 'package:words_power/ui/pages/detail_post/detail_post_page.dart';
import 'package:words_power/ui/pages/detail_post/detail_post_view_model.dart';

class DetailPostProvider extends StatelessWidget {
  const DetailPostProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return DetailPostViewModel();
      },
      child: const DetailPostPage(),
    );
  }
}
