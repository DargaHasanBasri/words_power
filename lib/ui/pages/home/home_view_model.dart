import 'package:words_power/base/base_view_model.dart';

import '../../../export.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel(this.userModel);
  final UserModel? userModel;

  ValueNotifier<Stream<List<UserModel>>> usersInfo = ValueNotifier(Stream.empty());

  Future<void> getFollowedUsers() async {
    if (userModel != null && userModel!.followings != null) {
      usersInfo.value = repository.getFollowedUsers(userModel!.followings!);
    }
  }
}
