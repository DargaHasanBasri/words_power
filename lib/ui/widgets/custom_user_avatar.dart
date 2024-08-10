import '../../export.dart';

class CustomUserAvatar extends StatelessWidget {
  final double? circleRadius;
  final String? profileImgAddress;
  final Color? borderColor;
  const CustomUserAvatar({
    super.key,
    this.circleRadius,
    required this.profileImgAddress,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: borderColor ?? Colors.white,
      ),
      child: CircleAvatar(
        radius: circleRadius ?? 30,
        backgroundImage: CachedNetworkImageProvider(
          profileImgAddress ??
              'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
        ),
      ),
    );
  }
}
