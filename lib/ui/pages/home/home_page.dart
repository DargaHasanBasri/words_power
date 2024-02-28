import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:words_power/base/base_stateful_state.dart';
import 'package:words_power/ui/pages/home/components/recently_added_item.dart';
import 'package:words_power/ui/pages/home/home_view_model.dart';
import '../../../utils/custom_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseStatefulState<HomePage> {
  late final HomeViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = Provider.of<HomeViewModel>(context, listen: false);
    listeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: CustomColors.backgroundColor,
        title: Text(
          vm.userName ?? "NULL",
          style: TextStyle(
            color: CustomColors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: _userProfiles(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            child: Text(
              "Recently Added",
              style: TextStyle(
                color: CustomColors.white,
                fontSize: 22,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return const RecentlyAddedItem(
                  wordAdded: "Word Word",
                  sentencesAdded: "Sentence Sentence addd Sentence addd",
                  imagesAdded: "images/bookmark_test.png",
                  byUserName: "Developer Dev",
                  dateAdded: "2 weeks ago",
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            child: Text(
              "Most Viewed",
              style: TextStyle(
                color: CustomColors.white,
                fontSize: 22,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return const AspectRatio(
                  aspectRatio: 1.6,
                  child: Card(
                    color: Colors.red,
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 20),
            ),
          ),
          const SizedBox(height: kBottomNavigationBarHeight + 60),
        ],
      ),
    );
  }

  Widget _userProfiles() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const CircleAvatar(
          radius: 24,
          child: Text("A"),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 10),
    );
  }

  listeners() {}
}
