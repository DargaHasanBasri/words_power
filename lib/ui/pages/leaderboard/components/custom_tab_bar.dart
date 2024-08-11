import '../../../../export.dart';

class CustomTabBar extends StatelessWidget {
  final VoidCallback leaderboardTabOnClick;
  final VoidCallback activitiesTabOnClick;
  final VoidCallback usersTabOnClick;
  final int currentTabIndex;

  const CustomTabBar({
    super.key,
    required this.leaderboardTabOnClick,
    required this.activitiesTabOnClick,
    required this.usersTabOnClick,
    required this.currentTabIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff423D3D).withOpacity(0.95),
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
                  splashColor: Color(0xffFA9884),
                  onTap: () => leaderboardTabOnClick.call(),
                  child: Ink(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Leaderboard',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Visibility(
                          visible: currentTabIndex == 0,
                          child: Container(
                            height: 3,
                            decoration: BoxDecoration(
                              color: Color(0xffFA9884),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],
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
                splashColor: Color(0xffFA9884),
                onTap: () => activitiesTabOnClick.call(),
                child: Ink(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
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
                      Visibility(
                        visible: currentTabIndex == 1,
                        child: Container(
                          height: 3,
                          decoration: BoxDecoration(
                            color: Color(0xffFA9884),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
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
                  splashColor: Color(0xffFA9884),
                  onTap: () => usersTabOnClick.call(),
                  child: Ink(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Users',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Visibility(
                          visible: currentTabIndex == 2,
                          child: Container(
                            height: 3,
                            decoration: BoxDecoration(
                              color: Color(0xffFA9884),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],
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
}
