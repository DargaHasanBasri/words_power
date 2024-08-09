import 'package:words_power/base/base_view_model.dart';

import '../../../export.dart';

class DetailUserViewModel extends BaseViewModel {
  final String? userID;
  DetailUserViewModel(this.userID);

  ValueNotifier<UserModel?> userModel = ValueNotifier(null);

  Future<void> getUser() async {
    if (userID != null) {
      userModel.value = await repository.getUser(userID!);
    }
  }

  Future<void> unFollow() async {
    String? currentUserId = firebaseAuth.currentUser!.uid;
    String? unfollowUserId = userID;

    if (unfollowUserId != null) {
      await repository.removeFollowing(currentUserId, unfollowUserId);
      await repository.removeFollower(unfollowUserId, currentUserId);
      getUser();
    }
  }
}
