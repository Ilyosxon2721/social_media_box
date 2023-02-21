import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';

class UpdateApp extends GetxController {
  Rx<AppUpdateInfo> updateInfo = AppUpdateInfo(
          updateAvailability: UpdateAvailability.updateNotAvailable,
          immediateUpdateAllowed: false,
          flexibleUpdateAllowed: false,
          availableVersionCode: 1,
          installStatus: InstallStatus.unknown,
          packageName: '',
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

  @override
  void onInit() {
    checkForUpdate();
    super.onInit();
  }
}
