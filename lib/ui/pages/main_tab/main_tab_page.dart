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
              backgroundColor: CustomColors.white,
              floatingActionButton: SpeedDial(
                activeIcon: Icons.close,
                icon: Icons.add,
                overlayColor: Colors.black,
                buttonSize: Size(70, 70),
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
              bottomNavigationBar: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30.0),
                ),
                child: BottomAppBar(
                  color: Color(0xff5790DF),
                  shape: const CircularNotchedRectangle(),
                  notchMargin: 14,
                  child: _buildNavigationBar(),
                ),
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
        Column(
          children: [
            Material(
              color: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    vm.currentIndex.value = 0;
                  },
                  child: Ink(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      'images/ic_home.png',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 6),
            Visibility(
              visible: vm.currentIndex.value == 0 ? true : false,
              child: Container(
                height: 3,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Material(
              color: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    vm.currentIndex.value = 1;
                  },
                  child: Ink(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      'images/ic_game.png',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 6),
            Visibility(
              visible: vm.currentIndex.value == 1 ? true : false,
              child: Container(
                height: 3,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 40),
        Column(
          children: [
            Material(
              color: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    vm.currentIndex.value = 2;
                  },
                  child: Ink(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      'images/ic_bookmark.png',
                      width: 24,
                      height: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 6),
            Visibility(
              visible: vm.currentIndex.value == 2 ? true : false,
              child: Container(
                height: 3,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Material(
              color: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    vm.currentIndex.value = 3;
                  },
                  child: Ink(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      'images/ic_person_account.png',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 6),
            Visibility(
              visible: vm.currentIndex.value == 3 ? true : false,
              child: Container(
                height: 3,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
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
