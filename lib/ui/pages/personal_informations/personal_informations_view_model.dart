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
    await apiBase.updateDocument(
      'users',
      '${userModel.userID}',
      userModel.toMap(),
    );
  }

  Future<void> uploadProfileImage() async {
    try {
      if (userModel?.profilePhoto != null) {
        await apiBase.deleteProfileImage(userModel!.profilePhoto!);
      }
      if (image.value != null) {
        String? downloadUrl = await repository.uploadImage(
          File(image.value!.path),
          userModel?.userID ?? '',
          'userProfiles',
        );
        if (downloadUrl != null) {
          await repository.updateDocumentField(
            'users',
            userModel?.userID ?? '',
            'profilePhoto',
            downloadUrl,
          );
        }
      }
    } catch (e) {
      print("Error uploading profile image: $e");
    }
  }


}
