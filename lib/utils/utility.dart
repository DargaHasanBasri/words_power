import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Utility {

  Future<XFile?> pickImageFromGallery(ImageSource imageSource) async {
    XFile? image;
    try {
      final pickedImage = await ImagePicker().pickImage(source: imageSource);
      if(pickedImage != null) {
        image = pickedImage;
      }
    } catch(e) {
      debugPrint(e.toString());
    }
    return image;
  }
}