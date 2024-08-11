import 'package:words_power/base/base_view_model.dart';

import '../../../export.dart';

class LeaderboardViewModel extends BaseViewModel {
  final UserModel? userModel;
  LeaderboardViewModel(this.userModel);

  ValueNotifier<int> currentTabIndex = ValueNotifier(1);
  ValueNotifier<Stream<List<UserModel>>> usersNotifier =
      ValueNotifier(Stream.empty());

  Future<Stream<List<UserModel>>> getTop100Users() async {
    return usersNotifier.value = await repository.getTop100Users();
  }
}
