import '../../../../export.dart';
import '../../../widgets/custom_user_avatar.dart';

class UsersTab extends StatelessWidget {
  final String defaultProfileImg =
      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png';
  const UsersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 200,
              color: Colors.transparent,
            ),
            Positioned(
              right: 10,
              top: 50,
              child: Column(
                children: [
                  CustomUserAvatar(
                    circleRadius: 40,
                    profileImgAddress: defaultProfileImg,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'David',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '1000',
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
            Positioned(
              top: 20,
              child: Column(
                children: [
                  CustomUserAvatar(
                    circleRadius: 50,
                    profileImgAddress: defaultProfileImg,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'David',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '1000',
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
            Positioned(
              left: 10,
              top: 50,
              child: Column(
                children: [
                  CustomUserAvatar(
                    circleRadius: 40,
                    profileImgAddress: defaultProfileImg,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'David',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '1000',
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
          ],
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.3),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                ),
              ]),
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
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: ClipRRect(
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.indigo.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {},
                      child: Ink(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.3),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              ),
                            ]),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          child: Row(
                            children: [
                              CustomUserAvatar(
                                circleRadius: 20,
                                profileImgAddress: defaultProfileImg,
                              ),
                              SizedBox(width: 24),
                              Text(
                                'Jackson',
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
                                    '1000',
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
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
