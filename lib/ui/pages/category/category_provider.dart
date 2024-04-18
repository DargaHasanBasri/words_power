import 'package:words_power/export.dart';
import 'package:words_power/ui/pages/category/category_page.dart';
import 'package:words_power/ui/pages/category/category_view_model.dart';

class CategoryProvider extends StatelessWidget {
  const CategoryProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return CategoryViewModel();
      },
      child: const CategoryPage(),
    );
  }
}
