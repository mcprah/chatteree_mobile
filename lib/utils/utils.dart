import 'dart:io';

import 'package:chatteree_mobile/utils/colors.dart';
import 'package:chatteree_mobile/utils/notification.dart';
import 'package:image_picker/image_picker.dart';

class Utils {
  static Future<File?> getFromGallery() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        File? imageFile = File(pickedFile.path);
        return imageFile;
      } else {
        return null;
      }
    } catch (e) {
      CNoty.showToast(
        message: 'Something went wrong, try again',
        color: AppColors.danger,
      );
    }
    return null;
  }
}
