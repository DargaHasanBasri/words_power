import 'package:words_power/base/base_view_model.dart';

import '../../../export.dart';

class UserInfoViewModel extends BaseViewModel {
  final UserModel? userModel;
  UserInfoViewModel(this.userModel);

  ValueNotifier<Stream<List<WordAndSentenceModel>>> userPosts =
      ValueNotifier(Stream.empty());

  Future<void> getUserPosts() async {
    if (userModel?.userID != null) {
      userPosts.value = repository.getUserPosts(userModel!.userID!);
    }
  }
}
