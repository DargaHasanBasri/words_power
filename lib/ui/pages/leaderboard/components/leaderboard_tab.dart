import '../../../../export.dart';

class LeaderBoardBoardTab extends StatefulWidget {
  final Stream<List<UserModel>> top100UsersModel;

  const LeaderBoardBoardTab({
    super.key,
    required this.top100UsersModel,
  });

  @override
  State<LeaderBoardBoardTab> createState() => _LeaderBoardBoardTabState();
}

class _LeaderBoardBoardTabState extends BaseStatefulState<LeaderBoardBoardTab> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UserModel>>(
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
            return Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 140,
                        decoration: BoxDecoration(
                          color: Color(0xffFA9884).withOpacity(0.8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 4,
                              offset: Offset(2, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: -40,
                              child: Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: CircleAvatar(
                                  radius: 36,
                                  backgroundImage: CachedNetworkImageProvider(
                                    users[1].profilePhoto ??
                                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: AppPaddings.pagePaddingVertical,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '${users[1].name}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    '${users[1].score}',
                                    style: TextStyle(
                                      color: Color(0xff009BD6),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: Color(0xffFA9884),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 4,
                              offset: Offset(2, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: -60,
                              child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: CircleAvatar(
                                  radius: 44,
                                  backgroundImage: CachedNetworkImageProvider(
                                    users[0].profilePhoto ??
                                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 60,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '${users[0].name}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    '${users[0].score}',
                                    style: TextStyle(
                                      color: Color(0xff009BD6),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 140,
                        decoration: BoxDecoration(
                          color: Color(0xffFA9884).withOpacity(0.8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 4,
                              offset: Offset(2, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: -40,
                              child: Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: CircleAvatar(
                                  radius: 36,
                                  backgroundImage: CachedNetworkImageProvider(
                                    users[2].profilePhoto ??
                                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: AppPaddings.pagePaddingVertical,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '${users[2].name}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    '${users[2].score}',
                                    style: TextStyle(
                                      color: Color(0xff009BD6),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffFA9884).withOpacity(0.9),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      child: ListView.separated(
                          itemCount: users.length - 3,
                          itemBuilder: (context, index) {
                            List<UserModel> topThreeOutsideUsersModel =
                                users.sublist(3);
                            return Material(
                              color: Colors.transparent,
                              child: InkWell(
                                splashColor: Color(0xff423D3D).withOpacity(0.3),
                                onTap: () {},
                                child: Ink(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 12,
                                    ),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundImage:
                                              CachedNetworkImageProvider(
                                            topThreeOutsideUsersModel[index]
                                                .profilePhoto
                                                .toString(),
                                          ),
                                        ),
                                        SizedBox(width: 24),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${topThreeOutsideUsersModel[index].name}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(height: 6),
                                            Text(
                                              '@userName',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 8,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Text(
                                          '${topThreeOutsideUsersModel[index].score}',
                                          style: TextStyle(
                                            color: Color(0xff009BD6),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Container(
                              height: 2,
                              decoration: BoxDecoration(
                                color: Color(0xff5F5959).withOpacity(0.5),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            );
                          }),
                    ),
                  ),
                ),
              ],
            );
          }
        });
  }
}
