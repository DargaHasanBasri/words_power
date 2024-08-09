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
}
