import 'package:words_power/ui/pages/detail_user/components/item_user_information.dart';
import 'package:words_power/ui/pages/detail_user/detail_user_view_model.dart';

import '../../../export.dart';

class DetailUserPage extends StatefulWidget {
  const DetailUserPage({super.key});

  @override
  State<DetailUserPage> createState() => _DetailUserPageState();
}

class _DetailUserPageState extends BaseStatefulState<DetailUserPage> {
  late final DetailUserViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = Provider.of<DetailUserViewModel>(context, listen: false);
    vm.getUser();
    listeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: vm.userModel,
              builder: (_, __, ___) {
                if (vm.userModel.value == null) {
                  return CircularProgressIndicator();
                }
                bool isFollow = vm.userModel.value!.followers!
                    .contains(firebaseAuth.currentUser!.uid);
                return ItemUserInformation(
                  isFollow: isFollow,
                  userName: vm.userModel.value?.name,
                  totalPost: vm.userModel.value?.posts.toString(),
                  totalFollowers:
                      vm.userModel.value?.followers?.length.toString(),
                  totalFollowings:
                      vm.userModel.value?.followings?.length.toString(),
                  profilePhotoAddress: vm.userModel.value?.profilePhoto,
                  score: vm.userModel.value?.score.toString(),
                  onTapIsFollowButton: (isFollow) async {
                    if (isFollow) {
                      await vm.unFollow();
                      appRoutes.navigateToReplacement(Routes.mainTab);
                    } else {
                      await vm.follow();
                      appRoutes.navigateToReplacement(Routes.mainTab);
                    }
                  },
                );
              }),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(
                  color: Color(0xffCBC4C4),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'images/ic_save.png',
                  width: 24,
                  height: 24,
                  color: Colors.black,
                ),
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color(0xffCBC4C4),
                    border: Border.symmetric(
                      vertical: BorderSide(
                        color: Color(0xffCBC4C4),
                        width: 1,
                      ),
                    ),
                  ),
                ),
                Image.asset(
                  'images/ic_save.png',
                  width: 24,
                  height: 24,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 12),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              AspectRatio(
                                aspectRatio: 0.7,
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: index == 0
                                          ? Radius.circular(30)
                                          : Radius.circular(0),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'images/background1.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              AspectRatio(
                                aspectRatio: 1.2,
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Image.asset(
                                    'images/background3.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            children: [
                              AspectRatio(
                                aspectRatio: 1.2,
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: index == 0
                                          ? Radius.circular(30)
                                          : Radius.circular(0),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'images/background3.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              AspectRatio(
                                aspectRatio: 0.7,
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'images/background2.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      forceMaterialTransparency: true,
      elevation: 0,
      leading: IconButton(
        icon: Image.asset(
          'images/ic_back.png',
          width: 24,
        ),
        onPressed: () {
          appRoutes.popIfBackStackNotEmpty();
        },
      ),
    );
  }

  void listeners() {}
}
