import 'package:words_power/export.dart';
import 'package:words_power/ui/pages/favorite/favorite_page.dart';
import 'package:words_power/ui/pages/favorite/favorite_view_model.dart';

class FavoriteProvider extends StatelessWidget {
  const FavoriteProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return FavoriteViewModel();
      },
      child: const FavoritePage(),
    );
  }
}
