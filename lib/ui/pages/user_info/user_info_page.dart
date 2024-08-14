import 'package:words_power/ui/pages/user_info/user_info_view_model.dart';
import 'package:words_power/ui/widgets/custom_user_avatar.dart';

import '../../../export.dart';
import 'components/item_user_post.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends BaseStatefulState<UserInfoPage> {
  late final UserInfoViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = Provider.of<UserInfoViewModel>(context, listen: false);
    vm.getUserPosts();
    listeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            SizedBox(height: 10),
            _userInfo(),
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
                    color: AppColors.black,
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
                    color: AppColors.black,
                  ),
                ],
              ),
            ),
            ValueListenableBuilder(
              valueListenable: vm.userPosts,
              builder: (_, __, ___) {
                return StreamBuilder<List<WordAndSentenceModel>>(
                  stream: vm.userPosts.value,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return showProgress(context);
                    } else if (snapshot.hasError) {
                      return Text('Bir hata oluştu: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      hideProgress();
                      return Text('Henüz kelime ve cümle eklenmedi.');
                    } else {
                      hideProgress();
                      final userPost = snapshot.data!;
                      return Expanded(
                        child: ListView.builder(
                          itemCount: userPost.length ?? 0,
                          itemBuilder: (context, index) {
                            debugPrint(userPost[index].userID);
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: ItemUserPost(),
                            );
                          },
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _userInfo() {
    return Column(
      children: [
        Row(
          children: [
            CustomUserAvatar(
              circleRadius: 50,
              profileImgAddress: vm.userModel?.profilePhoto,
              borderColor: Color(0xff242760),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    vm.userModel?.name?.toUpperCase() ?? '',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff242760),
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Row(
                    children: [
                      Text(
                        'Score, ${vm.userModel?.score?.toString() ?? '0'}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff544C4C),
                        ),
                      ),
                      Image.asset(
                        'images/level_star.png',
                        height: 24,
                        width: 24,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    vm.userModel?.posts.toString() ?? '',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xff242760),
                    ),
                  ),
                  Text(
                    'Posts',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff242760),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    vm.userModel?.followers?.length.toString() ?? '0',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xff242760),
                    ),
                  ),
                  Text(
                    'Followers',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff242760),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    vm.userModel?.followings?.length.toString() ?? '0',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xff242760),
                    ),
                  ),
                  Text(
                    'Followings',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff242760),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.white,
      automaticallyImplyLeading: false,
      forceMaterialTransparency: true,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.filter_list,
          ),
        ),
      ],
    );
  }

  void listeners() {}
}
