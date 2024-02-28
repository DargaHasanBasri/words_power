import 'package:flutter/material.dart';

import '../ui/widgets/custom_camera_gallery_popup.dart';
import '../ui/widgets/custom_popup_dialog.dart';

class DialogHelper {
  static exit(context) => showDialog(
        context: context,
        builder: (context) => const CustomPopupDialog(),
        barrierDismissible: false,
      );

  static isImageSource(
          context, Function onClickCamera, Function onClickGallery) =>
      showDialog(
        context: context,
        builder: (context) =>
            CustomCameraGalleryPopup(onClickCamera, onClickGallery),
        barrierDismissible: false,
      );
}
