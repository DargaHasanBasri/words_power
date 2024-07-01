import 'package:words_power/export.dart';
import 'package:words_power/ui/pages/home/components/activities_item.dart';
import 'package:words_power/ui/pages/home/home_view_model.dart';

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
    vm.getUsers();
    listeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: _userProfiles(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            child: Text(
              'Recently Added',
              style: TextStyle(
                color: CustomColors.white,
                fontSize: 22,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return const RecentlyAddedItem(
                  wordAdded: 'Word Word',
                  sentencesAdded: 'Sentence Sentence addd Sentence addd',
                  imagesAdded: 'images/bookmark_test.png',
                  byUserName: 'Developer Dev',
                  dateAdded: '2 weeks ago',
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            child: Text(
              'Activities',
              style: TextStyle(
                color: CustomColors.white,
                fontSize: 22,
              ),
            ),
          ),
          const Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: ActivitiesItem(),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ActivitiesItem(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 4),
          const Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: ActivitiesItem(),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ActivitiesItem(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: kBottomNavigationBarHeight + 60),
        ],
      ),
    );
  }

  Widget _userProfiles() {
    return ValueListenableBuilder(
        valueListenable: vm.usersInfo,
        builder: (_, __, ___) {
          return StreamBuilder<List<UserModel>>(
              stream: vm.usersInfo.value,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return showProgress(context);
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No data available'));
                } else {
                  hideProgress();
                  final users = snapshot.data!
                      .where((user) => user.userID != vm.userModel?.userID)
                      .toList();
                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    scrollDirection: Axis.horizontal,
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return CircleAvatar(
                        radius: 24,
                        child: Text(users[index].name[0].toUpperCase()),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                  );
                }
              });
        });
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: CustomColors.backgroundColor,
      title: Text(
        vm.userModel?.name ?? 'NULL',
        style: TextStyle(
          color: CustomColors.white,
        ),
      ),
      centerTitle: true,
    );
  }

  void listeners() {}
}
