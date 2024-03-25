import '../../../export.dart';
import 'category_page.dart';
import 'category_view_model.dart';

class CategoryProvider extends StatelessWidget {
  const CategoryProvider({Key? key}) : super(key: key);

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
