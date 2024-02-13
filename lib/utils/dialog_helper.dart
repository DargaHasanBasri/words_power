import 'package:flutter/material.dart';

import '../ui/widgets/custom_popup_dialog.dart';

class DialogHelper {
  static exit(context) => showDialog(
        context: context,
        builder: (context) => const CustomPopupDialog(),
        barrierDismissible: false,
      );
}
