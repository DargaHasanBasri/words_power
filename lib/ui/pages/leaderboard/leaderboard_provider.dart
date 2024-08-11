import 'package:words_power/export.dart';
import 'package:words_power/ui/pages/leaderboard/leaderboard_page.dart';
import 'package:words_power/ui/pages/leaderboard/leaderboard_view_model.dart';

class LeaderboardProvider extends StatelessWidget {
  final UserModel? userModel;

  const LeaderboardProvider(
    this.userModel, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return LeaderboardViewModel(userModel);
      },
      child: const LeaderboardPage(),
    );
  }
}
