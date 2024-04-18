import 'package:flutter/material.dart';
import 'package:words_power/ui/widgets/custom_camera_gallery_popup.dart';
import 'package:words_power/ui/widgets/custom_popup_dialog.dart';

class DialogHelper {
  static Future<dynamic> exit(BuildContext context) => showDialog(
        context: context,
        builder: (context) => const CustomPopupDialog(),
        barrierDismissible: false,
      );

  static Future<dynamic> isImageSource(
    BuildContext context,
    VoidCallback onClickCamera,
    VoidCallback onClickGallery,
  ) =>
      showDialog(
        context: context,
        builder: (context) =>
            CustomCameraGalleryPopup(onClickCamera, onClickGallery),
        barrierDismissible: false,
      );
}
