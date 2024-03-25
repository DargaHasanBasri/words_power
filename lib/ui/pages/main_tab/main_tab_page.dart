import '../../../export.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'main_tab_view_model.dart';

class MainTabPage extends StatefulWidget {
  const MainTabPage({Key? key}) : super(key: key);

  @override
  State<MainTabPage> createState() => _MainTabPageState();
}

class _MainTabPageState extends BaseStatefulState<MainTabPage> {
  late final MainTabViewModel vm;

  @override
  initState() {
    super.initState();
    vm = Provider.of<MainTabViewModel>(context, listen: false);
    listeners();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: vm.getUser(),
      builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          hideProgress();
          return _buildBody();
        } else if (snapshot.hasError) {
          return Text('Hata oluştu: ${snapshot.error}');
        } else {
          return showProgress(context);
        }
      },
    );
  }

  Widget _buildBody() {
    return ValueListenableBuilder(
        valueListenable: vm.userModel,
        builder: (_, __, ___) {
          return ValueListenableBuilder(
              valueListenable: vm.currentIndex,
              builder: (_, __, ___) {
                return Scaffold(
                  extendBody: true,
                  backgroundColor: CustomColors.backgroundColor,
                  floatingActionButton: SpeedDial(
                    activeIcon: Icons.close,
                    icon: Icons.add,
                    overlayColor: Colors.black,
                    overlayOpacity: 0.5,
                    childrenButtonSize: const Size(100, 60),
                    children: [
                      SpeedDialChild(
                        child: const Text("W&S"),
                      ),
                      SpeedDialChild(
                        onTap: () {
                          appRoutes.navigateTo(
                            Routes.wordSentenceAdd,
                            arguments: vm.userModel.value,
                          );
                        },
                        child: const Text("W&S ADD"),
                      ),
                    ],
                  ),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerDocked,
                  bottomNavigationBar: BottomAppBar(
                    shape: const CircularNotchedRectangle(),
                    notchMargin: 10,
                    child: _buildNavigationBar(),
                  ),
                  body: _getBody(vm.currentIndex.value),
                );
              });
        });
  }

  Widget _buildNavigationBar() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: Image.asset(
            "images/ic_home.png",
            width: 28,
          ),
          onPressed: () {
            vm.currentIndex.value = 0;
          },
        ),
        IconButton(
          icon: Image.asset(
            "images/ic_bookmark.png",
            width: 28,
          ),
          onPressed: () {
            vm.currentIndex.value = 1;
          },
        ),
        const SizedBox(width: 10),
        IconButton(
          icon: Image.asset(
            "images/ic_favorite.png",
            width: 28,
          ),
          onPressed: () {
            vm.currentIndex.value = 2;
          },
        ),
        IconButton(
          icon: Image.asset(
            "images/ic_user_settings.png",
            width: 28,
          ),
          onPressed: () {
            vm.currentIndex.value = 3;
          },
        )
      ],
    );
  }

  Widget _getBody(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return HomeProvider(vm.userModel.value?.name);
      case 1:
        return const WordSentenceListProvider();
      case 2:
        return const FavoriteProvider();
      case 3:
        return SettingsProvider(vm.userModel.value);
      default:
        return SettingsProvider(vm.userModel.value);
    }
  }

  listeners() {}
}
