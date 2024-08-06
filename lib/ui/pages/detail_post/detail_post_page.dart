import 'package:words_power/export.dart';
import 'package:words_power/ui/pages/detail_post/detail_post_view_model.dart';

class DetailPostPage extends StatefulWidget {
  const DetailPostPage({super.key});

  @override
  State<DetailPostPage> createState() => _DetailPostPageState();
}

class _DetailPostPageState extends BaseStatefulState<DetailPostPage> {
  late final DetailPostViewModel vm;
  ScrollController listViewController = ScrollController();

  @override
  void initState() {
    super.initState();
    vm = Provider.of<DetailPostViewModel>(context, listen: false);
    listeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: _buildAppBar(),
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
            child: const Text('Detail Post'),
          ),
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
          width: 26,
        ),
        onPressed: () {
          appRoutes.popIfBackStackNotEmpty();
        },
      ),
    );
  }

  void listeners() {}
}
