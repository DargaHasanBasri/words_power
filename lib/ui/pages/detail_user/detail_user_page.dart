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
    listeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE6EEFA),
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Column(
            children: [Image.asset('images/img_detail_user_background.png')],
          ),
          _userInfoDetail(context),
          Positioned(
            top: 20,
            child: GestureDetector(
              onTap: () {
                appRoutes.popIfBackStackNotEmpty();
              },
              child: Container(
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Center(
                  child: Image.asset(
                    'images/ic_back.png',
                    color: Colors.black,
                    height: 24,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _userInfoDetail(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        color: Color(0xffE6EEFA),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: -50,
            child: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 40,
                backgroundImage: CachedNetworkImageProvider(
                  'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          '1000',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text('Followers'),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '847',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text('Following'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Kullanıcı Adı',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomButton(
                          backgroundColor: Color(0xff5790DF),
                          title: 'Following',
                          titleColor: Colors.white,
                          borderRadius: 26,
                          onClick: () {},
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: CustomButton(
                          backgroundColor: Color(0xff5790DF),
                          title: 'Game Call',
                          titleColor: Colors.white,
                          borderRadius: 26,
                          onClick: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void listeners() {}
}
