import 'package:words_power/export.dart';
import 'package:words_power/ui/pages/leaderboard/leaderboard_page.dart';
import 'package:words_power/ui/pages/leaderboard/leaderboard_view_model.dart';

class LeaderboardProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return LeaderboardViewModel();
      },
      child: const LeaderboardPage(),
    );
  }
}
