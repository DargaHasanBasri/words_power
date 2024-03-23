import 'package:flutter/material.dart';

import '../../utils/custom_colors.dart';

class CustomCameraGalleryPopup extends StatelessWidget {
  final Function onClickCamera;
  final Function onClickGallery;

  const CustomCameraGalleryPopup(this.onClickCamera, this.onClickGallery,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / 4),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        elevation: 0,
        backgroundColor: CustomColors.buttonBackground,
        child: _buildContent(context, onClickCamera, onClickGallery),
      ),
    );
  }

  Widget _buildContent(
      BuildContext context, Function onClickCamera, Function onClickGallery) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.exit_to_app,
              color: CustomColors.white,
            ),
          ),
        ),
        const SizedBox(height: 60),
        IconButton(
          onPressed: () => onClickCamera.call(),
          icon: Icon(
            Icons.camera,
            color: CustomColors.white,
          ),
        ),
        const SizedBox(height: 20),
        IconButton(
          onPressed: () => onClickGallery.call(),
          icon: Icon(
            Icons.camera_enhance_rounded,
            color: CustomColors.white,
          ),
        ),
      ],
    );
  }
}
