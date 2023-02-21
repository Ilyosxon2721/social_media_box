import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dialog_container.dart';

showScreenshotDialog(BuildContext context, Uint8List image) {
  continueCallBack() => {
        Navigator.of(context).pop(),
        // code on continue comes here
      };
  BlurryDialog alert = BlurryDialog("Screenshot".tr, image, continueCallBack);

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
