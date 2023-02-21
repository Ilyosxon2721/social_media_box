import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_box/controller/getter.dart';

class PinCodeControllerClass extends GetxController {
  RxString firstPin = ''.obs;
  RxString secondPin = ''.obs;
  RxBool openConfirm = false.obs;
  RxBool enablePinCode = false.obs;
  RxString pinCode = ''.obs;
  Rx<TextEditingController> pinPutController = TextEditingController().obs;

  void setFirstPin(String value) {
    firstPin.value = value;
    update();
  }

  void setPinCode(String value) {
    pinCode.value = value;
    storageController.openPinBox().then((box) {
      box.put(0, value);
    });
    update();
  }
}
