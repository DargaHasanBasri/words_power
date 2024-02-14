import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_power/ui/pages/category/category_page.dart';
import 'package:words_power/ui/pages/category/category_view_model.dart';

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
