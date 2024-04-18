import 'package:words_power/base/base_view_model.dart';

import 'package:words_power/export.dart';

class PersonalInformationsViewModel extends BaseViewModel {
  PersonalInformationsViewModel(this.userModel);
  final UserModel? userModel;

  ValueNotifier<XFile?> image = ValueNotifier(null);

  Future<void> pickImage(ImageSource imageSource) async {
    image.value = await Utility().pickImageFromGallery(imageSource);
  }
}
