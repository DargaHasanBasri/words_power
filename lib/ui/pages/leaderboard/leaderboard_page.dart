import 'package:words_power/ui/pages/leaderboard/components/custom_tab_bar.dart';
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
                CustomTabBar(
                  leaderboardTabOnClick: () async {
                    vm.currentTabIndex.value = 0;
                    await vm.getTop100Users();
                  },
                  activitiesTabOnClick: () {
                    vm.currentTabIndex.value = 1;
                  },
                  usersTabOnClick: () async {
                    vm.currentTabIndex.value = 2;
                    await vm.getTop100Users();
                  },
                  currentTabIndex: vm.currentTabIndex.value,
                ),
                Expanded(
                  child: vm.currentTabIndex.value == 0
                      ? Padding(
                          padding: const EdgeInsets.only(top: 70),
                          child: ValueListenableBuilder(
                            valueListenable: vm.usersNotifier,
                            builder: (_, __, ___) {
                              return LeaderBoardBoardTab(
                                top100UsersModel: vm.usersNotifier.value,
                              );
                            },
                          ),
                        )
                      : vm.currentTabIndex.value == 1
                          ? _activitiesTab()
                          : Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: ValueListenableBuilder(
                                valueListenable: vm.usersNotifier,
                                builder: (_, __, ___) {
                                  return UsersTab(
                                    top100UsersModel: vm.usersNotifier.value,
                                    loggedInUserModel: vm.userModel!,
                                    onClickISFollow: (clickUserID) {
                                      appRoutes.navigateTo(
                                        Routes.detailUser,
                                        arguments: clickUserID,
                                      );
                                    },
                                    onClickUser: () {},
                                  );
                                },
                              ),
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

  Widget _activitiesTab() {
    return Column(
      children: [Text('Activities')],
    );
  }

  void listeners() {}
}
