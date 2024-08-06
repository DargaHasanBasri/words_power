import 'package:words_power/export.dart';
import 'package:words_power/ui/pages/detail_post/components/user_comments.dart';
import 'package:words_power/ui/pages/detail_post/detail_post_view_model.dart';

class DetailPostPage extends StatefulWidget {
  const DetailPostPage({super.key});

  @override
  State<DetailPostPage> createState() => _DetailPostPageState();
}

class _DetailPostPageState extends BaseStatefulState<DetailPostPage> {
  late final DetailPostViewModel vm;
  ScrollController listViewController = ScrollController();

  @override
  void initState() {
    super.initState();
    vm = Provider.of<DetailPostViewModel>(context, listen: false);
    listeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe6eefa),
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _userDateInfo(),
            SizedBox(height: 20),
            AspectRatio(
              aspectRatio: 1.6,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: CustomColors.white,
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    image: AssetImage('images/bookmark_test.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Örnek Cümle:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Search for your friends on the app and connect with them.'),
            SizedBox(height: 20),
            _userActions(),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return UserComments();
                },
              ),
            ),
          ],
        ),
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
      title: Text('Detail'),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: IconButton(
            icon: Image.asset(
              'images/ic_bookmark.png',
              width: 24,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _userDateInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Container(
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
              radius: 16,
              backgroundImage: CachedNetworkImageProvider(
                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
              ),
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Kullanıcı Adı'),
              Text('06.08.2024'),
            ],
          ),
          Spacer(),
          Text(
            'Kelime -> Elma',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _userActions() {
    return Row(
      children: [
        IconButton(
          icon: Image.asset(
            'images/ic_favorite.png',
            width: 24,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        Text('20'),
        SizedBox(width: 10),
        IconButton(
          icon: Image.asset(
            'images/ic_comment.png',
            width: 24,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        Text('20'),
        Spacer(),
        Text('20 dk önce'),
      ],
    );
  }

  void listeners() {}
}
