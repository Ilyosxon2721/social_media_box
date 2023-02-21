import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../../controller/getter.dart';

class SecurityScreenDialogs extends GetxController {
  void setPinDialog() {
    Get.defaultDialog(
      barrierDismissible: false,
      title: 'Set PIN code'.tr,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 20,
          ),
          Pinput(
            autofocus: true,
            keyboardType: TextInputType.number,
            onCompleted: (value) {
              pinCodeController.setPinCode(value);
              Timer(
                const Duration(milliseconds: 500),
                () {
                  Get.back();
                  Get.snackbar(
                    'Success'.tr,
                    "PIN code saved".trParams(
                      {'pinCode': pinCodeController.pinCode.value},
                    ),
                    icon: const Icon(Icons.save),
                  );
                },
              );
            },
          ),
        ],
      ),
      onWillPop: () async {
        Get.back();
        return false;
      },
    );
  }

  void oldPinDialog() {
    Get.defaultDialog(
      barrierDismissible: false,
      title: 'Old PIN code'.tr,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 20,
          ),
          Pinput(
            autofocus: true,
            validator: (s) {
              if (s == pinCodeController.pinCode.value) {
                return null;
              }
              return 'Wrong PIN code'.tr;
            },
            onCompleted: (value) {
              if (value == pinCodeController.pinCode.value) {
                Get.back();
                setPinDialog();
              } else {}
            },
          ),
        ],
      ),
      onWillPop: () async {
        Get.back();
        return false;
      },
    );
  }

  void checkPinCodeDialog(String uri, String routeVal) {
    Get.defaultDialog(
      barrierDismissible: false,
      title: 'Enter PIN code'.tr,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 20,
          ),
          Pinput(
            autofocus: true,
            validator: (s) {
              if (s == pinCodeController.pinCode.value) {
                return null;
              }
              return 'Wrong PIN code'.tr;
            },
            onCompleted: (value) {
              if (value == pinCodeController.pinCode.value) {
                Get.back();
                route.allPanelRoute(uri, routeVal);
              } else {}
            },
          ),
        ],
      ),
      onWillPop: () async {
        Get.back();
        return false;
      },
    );
  }

  void errorPinCodeIsNotSet() {
    Get.defaultDialog(
      barrierDismissible: false,
      title: 'Error'.tr,
      content: Text('PIN code not set'.tr),
      onWillPop: () async {
        Get.back();
        return false;
      },
    );
  }

  void getPinCodeDialog() {
    if (pinCodeController.pinCode.isEmpty) {
      setPinDialog();
    } else {
      oldPinDialog();
    }
  }
}
