import '../../../export.dart';
import 'favorite_page.dart';
import 'favorite_view_model.dart';

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
