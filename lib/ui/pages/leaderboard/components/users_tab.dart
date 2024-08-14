import '../../../../export.dart';
import '../../../widgets/custom_user_avatar.dart';

class UsersTab extends StatefulWidget {
  final Stream<List<UserModel>> top100UsersModel;
  final VoidCallback onClickUser;
  final void Function(String onClickUserID) onClickISFollow;
  final UserModel loggedInUserModel;

  const UsersTab({
    super.key,
    required this.top100UsersModel,
    required this.onClickUser,
    required this.onClickISFollow,
    required this.loggedInUserModel,
  });

  @override
  State<UsersTab> createState() => _UsersTabState();
}

class _UsersTabState extends BaseStatefulState<UsersTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.3),
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
            child: Row(
              children: [
                Text(
                  'Kullanıcı Ara',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        StreamBuilder<List<UserModel>>(
            stream: widget.top100UsersModel,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return showProgress(context);
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No data available'));
              } else {
                hideProgress();
                final users = snapshot.data!;
                return Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: ClipRRect(
                      child: ListView.separated(
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          bool isFollowing =
                              widget.loggedInUserModel.followings!.contains(
                            users[index].userID,
                          );
                          bool isLoggedInUser = users[index].userID !=
                              widget.loggedInUserModel.userID;
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.black.withOpacity(0.25),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                splashColor: Color(0xffFA9884),
                                borderRadius: BorderRadius.circular(12),
                                onTap: () => widget.onClickUser.call(),
                                child: Ink(
                                  decoration: BoxDecoration(
                                    color: Color(0xffFCFCFC),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 12,
                                    ),
                                    child: Row(
                                      children: [
                                        CustomUserAvatar(
                                          circleRadius: 20,
                                          profileImgAddress:
                                              users[index].profilePhoto,
                                        ),
                                        SizedBox(width: 24),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${users[index].name}',
                                              style: TextStyle(
                                                color: AppColors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '${users[index].score}',
                                                  style: TextStyle(
                                                    color: AppColors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                SizedBox(width: 4),
                                                Image.asset(
                                                  'images/ic_like.png',
                                                  color: Colors.red,
                                                  width: 18,
                                                  height: 18,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        isLoggedInUser
                                            ? IconButton(
                                                onPressed: () {
                                                  widget.onClickISFollow(
                                                    users[index].userID!,
                                                  );
                                                },
                                                icon: Image.asset(
                                                  isFollowing
                                                      ? 'images/ic_follow_tic.png'
                                                      : 'images/ic_follow_plus.png',
                                                  width: 24,
                                                  height: 24,
                                                ),
                                              )
                                            : Padding(
                                              padding: const EdgeInsets.only(right: 10),
                                              child: Text(
                                                  'Ben',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                  ),
                                                ),
                                            ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 20),
                      ),
                    ),
                  ),
                );
              }
            }),
      ],
    );
  }
}
