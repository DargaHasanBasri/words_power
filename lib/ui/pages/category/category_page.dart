import 'package:words_power/export.dart';
import 'package:words_power/ui/pages/category/category_view_model.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

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
              border: Border.all(
                width: 4,
                color: CustomColors.textFormFieldBorderColor,
              ),
            ),
            child: const Text('Kategoriler'),
          ),
        ),
      ),
    );
  }

  void listeners() {}
}
