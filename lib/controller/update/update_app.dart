import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:social_media_box/controller/getter.dart';

class UpdateApp extends GetxController {
  Rx<AppUpdateInfo> updateInfo = AppUpdateInfo(
          updateAvailability: UpdateAvailability.updateNotAvailable,
          immediateUpdateAllowed: true,
          flexibleUpdateAllowed: true,
          availableVersionCode: 1,
          installStatus: InstallStatus.unknown,
          packageName: infos.packageName.value,
          clientVersionStalenessDays: 1,
          updatePriority: 1)
      .obs;
  RxBool progress = false.obs;
  Future<void> checkForUpdate() async {
    progress.value = true;
    InAppUpdate.checkForUpdate().then((info) {
      updateInfo.value = info;
      progress.value = false;
      if (info.updateAvailability == UpdateAvailability.updateAvailable) {
        // Get.snackbar('New Version', info.updateAvailability.value.toString());
      } else {
        Get.snackbar(
          'Error'.tr,
          'Update not found'.tr,
        );
      }
    }).catchError((e) {
      Get.snackbar('Error'.tr, e);
    });
  }

  Future<void> flexibleUpdate() async {
    progress.value = true;
    InAppUpdate.startFlexibleUpdate()
        .then((value) {
          print(value.reactive.listeners);
          print(value);
        })
        .catchError((e) => Get.dialog(Text(e)))
        .whenComplete(() => progress.value = false);
  }

  @override
  void onInit() {
    checkForUpdate();
    super.onInit();
  }
}
