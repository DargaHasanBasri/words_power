import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:words_power/export.dart';
import 'package:words_power/ui/pages/main_tab/main_tab_view_model.dart';

class MainTabPage extends StatefulWidget {
  const MainTabPage({super.key});

  @override
  State<MainTabPage> createState() => _MainTabPageState();
}

class _MainTabPageState extends BaseStatefulState<MainTabPage> {
  late final MainTabViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = Provider.of<MainTabViewModel>(context, listen: false);
    vm.getUser();
    listeners();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: vm.getUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return _buildBody();
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
                    child: const Text('W&S'),
                  ),
                  SpeedDialChild(
                    onTap: () {
                      appRoutes.navigateTo(
                        Routes.wordSentenceAdd,
                        arguments: vm.userModel.value,
                      );
                    },
                    child: const Text('W&S ADD'),
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
          },
        );
      },
    );
  }

  Widget _buildNavigationBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: Image.asset(
            'images/ic_home.png',
            width: vm.currentIndex.value == 0 ? 28 : 24,
          ),
          onPressed: () {
            vm.currentIndex.value = 0;
          },
        ),
        IconButton(
          icon: Image.asset(
            'images/ic_bookmark.png',
            width: vm.currentIndex.value == 1 ? 28 : 24,
          ),
          onPressed: () {
            vm.currentIndex.value = 1;
          },
        ),
        const SizedBox(width: 10),
        IconButton(
          icon: Image.asset(
            'images/ic_favorite.png',
            width: vm.currentIndex.value == 2 ? 28 : 24,
          ),
          onPressed: () {
            vm.currentIndex.value = 2;
          },
        ),
        IconButton(
          icon: Image.asset(
            'images/ic_user_settings.png',
            width: vm.currentIndex.value == 3 ? 28 : 24,
          ),
          onPressed: () {
            vm.currentIndex.value = 3;
          },
        ),
      ],
    );
  }

  Widget _getBody(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return HomeProvider(vm.userModel.value);
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

  void listeners() {}
}
