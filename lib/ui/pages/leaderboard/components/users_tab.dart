import '../../../../export.dart';
import '../../../widgets/custom_user_avatar.dart';

class UsersTab extends StatefulWidget {
  final Stream<List<UserModel>> top100UsersModel;
  const UsersTab({
    super.key,
    required this.top100UsersModel,
  });

  @override
  State<UsersTab> createState() => _UsersTabState();
}

class _UsersTabState extends BaseStatefulState<UsersTab> {
  final String defaultProfileImg =
      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png';

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
                    color: Colors.black,
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
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
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
                                onTap: () {},
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
                                          profileImgAddress: users[index].profilePhoto,
                                        ),
                                        SizedBox(width: 24),
                                        Text(
                                          '${users[index].name}',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Spacer(),
                                        Row(
                                          children: [
                                            Text(
                                              '${users[index].score}',
                                              style: TextStyle(
                                                color: Colors.black,
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
