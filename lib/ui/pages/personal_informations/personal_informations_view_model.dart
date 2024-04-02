import 'package:words_power/base/base_view_model.dart';

import '../../../export.dart';

class PersonalInformationsViewModel extends BaseViewModel {
  final UserModel? userModel;
  PersonalInformationsViewModel(this.userModel);

  ValueNotifier<XFile?> image = ValueNotifier(null);

  void pickImage(ImageSource imageSource) async {
    image.value = await Utility().pickImageFromGallery(imageSource);
  }
}
