import 'package:words_power/ui/pages/leaderboard/components/leaderboard_tab.dart';
import 'package:words_power/ui/pages/leaderboard/components/users_tab.dart';
import 'package:words_power/ui/pages/leaderboard/leaderboard_view_model.dart';

import '../../../export.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends BaseStatefulState<LeaderboardPage> {
  late final LeaderboardViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = Provider.of<LeaderboardViewModel>(context, listen: false);
    listeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ValueListenableBuilder(
          valueListenable: vm.currentTabIndex,
          builder: (_, __, ___) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _customTabBar(),
                Expanded(
                  child: vm.currentTabIndex.value == 0
                      ? Padding(
                          padding: const EdgeInsets.only(top: 70),
                          child: LeaderBoardBoardTab(),
                        )
                      : vm.currentTabIndex.value == 1
                          ? _activitiesTab()
                          : Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: UsersTab(),
                            ),
                ),
              ],
            );
          },
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
      title: ValueListenableBuilder(
          valueListenable: vm.currentTabIndex,
          builder: (_, __, ___) {
            return Text(
              vm.currentTabIndex.value == 0
                  ? 'Leaderboard'
                  : vm.currentTabIndex.value == 1
                      ? 'Activities'
                      : 'Users',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            );
          }),
      centerTitle: true,
    );
  }

  Widget _customTabBar() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff423D3D).withOpacity(0.95),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Color(0xffFA9884),
                  onTap: () {
                    vm.currentTabIndex.value = 0;
                  },
                  child: Ink(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Leaderboard',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Visibility(
                          visible: vm.currentTabIndex.value == 0,
                          child: Container(
                            height: 3,
                            decoration: BoxDecoration(
                              color: Color(0xffFA9884),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Color(0xffFA9884),
                onTap: () {
                  vm.currentTabIndex.value = 1;
                },
                child: Ink(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Activities',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Visibility(
                        visible: vm.currentTabIndex.value == 1,
                        child: Container(
                          height: 3,
                          decoration: BoxDecoration(
                            color: Color(0xffFA9884),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Color(0xffFA9884),
                  onTap: () {
                    vm.currentTabIndex.value = 2;
                  },
                  child: Ink(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Users',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Visibility(
                          visible: vm.currentTabIndex.value == 2,
                          child: Container(
                            height: 3,
                            decoration: BoxDecoration(
                              color: Color(0xffFA9884),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _activitiesTab() {
    return Column(
      children: [Text('Activities')],
    );
  }

  void listeners() {}
}
