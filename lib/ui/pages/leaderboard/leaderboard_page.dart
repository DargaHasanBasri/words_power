import 'package:words_power/ui/pages/leaderboard/components/top_three.dart';
import 'package:words_power/ui/pages/leaderboard/leaderboard_view_model.dart';

import '../../../export.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends BaseStatefulState<LeaderboardPage> {
  late final LeaderboardViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = Provider.of<LeaderboardViewModel>(context, listen: false);
    listeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE6EEFA),
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _customTabBar(),
            TopThree(),
          ],
        ),
      ),
    );
  }

  Widget _customTabBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.indigo.withOpacity(0.5),
                  onTap: () {},
                  child: Ink(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Activities',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.indigo.withOpacity(0.5),
                onTap: () {},
                child: Ink(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Ranking',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.indigo.withOpacity(0.5),
                  onTap: () {},
                  child: Ink(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'My Activities',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
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
      title: Text(
        'Leaderboard',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      centerTitle: true,
    );
  }

  void listeners() {}
}
