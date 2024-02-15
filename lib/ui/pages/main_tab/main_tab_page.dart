import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:words_power/ui/pages/main_tab/main_tab_view_model.dart';

import '../../../utils/custom_colors.dart';

class MainTabPage extends StatefulWidget {
  const MainTabPage({Key? key}) : super(key: key);

  @override
  State<MainTabPage> createState() => _MainTabPageState();
}

class _MainTabPageState extends State<MainTabPage> {
  late final MainTabViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = Provider.of<MainTabViewModel>(context, listen: false);
    listeners();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: vm.currentIndex,
      builder: (_,__,___) {
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
                child: Icon(Icons.share_arrival_time),
              ),
              SpeedDialChild(
                child: Icon(Icons.add_a_photo),
              ),
            ],

          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 10,
            child: _buildNavigationBar(),
          ),
          body: vm.pages[vm.currentIndex.value],
        );
      }
    );
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

  listeners() {}
}
