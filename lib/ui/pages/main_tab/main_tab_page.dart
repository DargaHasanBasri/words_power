import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:words_power/base/base_stateful_state.dart';
import 'package:words_power/models/user_model.dart';
import 'package:words_power/ui/pages/main_tab/main_tab_view_model.dart';

import '../../../utils/custom_colors.dart';
import '../category/category_provider.dart';
import '../home/home_provider.dart';
import '../onboarding/onboarding_provider.dart';

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
    vm.getUser();
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
                  //resizeToAvoidBottomInset: false,
                  extendBody: true,
                  backgroundColor: CustomColors.backgroundColor,
                  floatingActionButton: SpeedDial(
                    activeIcon: Icons.close,
                    icon: Icons.add,
                    overlayColor: Colors.grey,
                    overlayOpacity: 0.3,
                    children: [
                      SpeedDialChild(
                        child: const Icon(Icons.share_arrival_time),
                      ),
                      SpeedDialChild(
                        child: const Icon(Icons.add_a_photo),
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
          icon: const Icon(Icons.home),
          onPressed: () {
            vm.currentIndex.value = 0;
          },
        ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            vm.currentIndex.value = 1;
          },
        ),
        const SizedBox(width: 10),
        IconButton(
          icon: const Icon(Icons.favorite_border_outlined),
          onPressed: () {
            vm.currentIndex.value = 2;
          },
        ),
        IconButton(
          icon: const Icon(Icons.account_circle_outlined),
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
        return const CategoryProvider();
      case 2:
        return const OnboardingProvider();
      case 3:
        return const CategoryProvider();
      default:
        return const OnboardingProvider();
    }
  }

  listeners() {}
}
