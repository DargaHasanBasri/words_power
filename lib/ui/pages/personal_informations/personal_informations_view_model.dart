import 'package:words_power/base/base_view_model.dart';

import 'package:words_power/export.dart';

class PersonalInformationsViewModel extends BaseViewModel {
  PersonalInformationsViewModel(this.userModel);
  final UserModel? userModel;

  ValueNotifier<XFile?> image = ValueNotifier(null);
  ValueNotifier<UserModel> userNewModel = ValueNotifier(UserModel());

  Future<void> pickImage(ImageSource imageSource) async {
    image.value = await Utility().pickImageFromGallery(imageSource);
  }

  Future<void> updateUserInfo(UserModel userModel) async {
    apiBase.updateDocument(
      'users',
      '${userModel.userID}',
      userModel.toMap(),
    );
  }
}
