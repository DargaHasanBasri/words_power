import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_power/ui/pages/category/category_view_model.dart';

import '../../../utils/custom_colors.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late final CategoryViewModel vm;
  ScrollController listViewController = ScrollController();

  @override
  void initState() {
    super.initState();
    vm = Provider.of<CategoryViewModel>(context, listen: false);
    listeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      //extendBodyBehindAppBar: true,
      backgroundColor: CustomColors.backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              color: CustomColors.white,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(width: 4, color: CustomColors.textFormFieldBorderColor),
            ),
            child: const Text("Kategoriler"),
          ),
        ),
      ),
    );
  }

  listeners() {}
}
