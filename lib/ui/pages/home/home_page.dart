import 'package:words_power/export.dart';
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
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _userProfiles(),
              SizedBox(height: 4),
              ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return RecentlyAddedItem(
                    onPressDetail: () {
                      appRoutes.navigateTo(Routes.detailPost);
                    },
                    wordAdded: 'Word Word',
                    sentencesAdded: 'Sentence Sentence addd Sentence addd',
                    imagesAdded: 'images/bookmark_test.png',
                    byUserName: 'Developer Dev',
                    dateAdded: '2 weeks ago',
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
              ),
              const SizedBox(height: kBottomNavigationBarHeight + 60),
            ],
          ),
        ),
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
                  return Container(
                    height: 100,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      scrollDirection: Axis.horizontal,
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              height: 80,
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(
                                  color: Color(0xff648fd9),
                                  width: 2,
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 34,
                                backgroundImage: CachedNetworkImageProvider(
                                  '${users[index].profilePhoto}',
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: 60,
                                child: Text(
                                  '${users[index].name?.toUpperCase()}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 1,
                                ),
                                alignment: Alignment.center,
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 10),
                    ),
                  );
                }
              });
        });
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      forceMaterialTransparency: true,
      elevation: 0,
      title: Text(
        'Explore',
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: [
        CircleAvatar(
          radius: 24,
          child: Image.asset('images/ic_notifications.png'),
        ),
        SizedBox(width: 12),
      ],
    );
  }

  void listeners() {}
}
