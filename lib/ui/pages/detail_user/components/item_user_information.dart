import 'package:words_power/ui/widgets/custom_user_avatar.dart';

import '../../../../export.dart';

class ItemUserInformation extends StatelessWidget {
  final String? userName;
  final String? totalPost;
  final String? totalFollowers;
  final String? totalFollowings;
  final String? profilePhotoAddress;
  final String? score;
  final bool isFollow;
  final void Function(bool isFollow) onTapIsFollowButton;

  const ItemUserInformation({
    super.key,
    required this.userName,
    required this.totalPost,
    required this.totalFollowers,
    required this.totalFollowings,
    required this.profilePhotoAddress,
    required this.onTapIsFollowButton,
    required this.isFollow,
    this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  totalFollowers?.toString() ?? '',
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
            CustomUserAvatar(
              circleRadius: 50,
              profileImgAddress: profilePhotoAddress,
              borderColor: Color(0xff242760),
            ),
            Column(
              children: [
                Text(
                  totalFollowings?.toString() ?? '',
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
        SizedBox(height: 10),
        Text(
          userName?.toUpperCase() ?? '',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xff242760),
          ),
        ),
        Text(
          '${totalPost?.toString() ?? ''} Posts @${userName?.toLowerCase() ?? ''}',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xff242760),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Score, ${score?.toString() ?? '0'}',
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
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                  title: isFollow ? 'Unfollow' : 'Follow',
                  titleColor: Colors.white,
                  backgroundColor: Color(0xff242760),
                  borderRadius: 12,
                  onClick: () => onTapIsFollowButton(isFollow),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: CustomButton(
                  title: 'Game Invite',
                  titleColor: Colors.white,
                  backgroundColor: Color(0xff242760),
                  borderRadius: 12,
                  onClick: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
