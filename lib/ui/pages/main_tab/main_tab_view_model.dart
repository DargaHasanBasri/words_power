import 'package:words_power/base/base_view_model.dart';
import 'package:words_power/export.dart';

class MainTabViewModel extends BaseViewModel {
  ValueNotifier<int> currentIndex = ValueNotifier(0);
  ValueNotifier<UserModel?> userModel = ValueNotifier(null);

  Future<UserModel> getUser() async {
    return fireBaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .get()
        .then((value) {
      return userModel.value = UserModel.fromMap(value.data()!);
    });
  }
}
