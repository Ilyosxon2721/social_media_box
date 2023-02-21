import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class GetAppInfo extends GetxController {
  RxString appName = ''.obs;
  RxString appVersion = ''.obs;
  RxString packageName = ''.obs;
  RxString builderNumber = ''.obs;
  RxString storeName = ''.obs;
  @override
  void onInit() {
    getAppInfo();
    super.onInit();
  }

  void getAppInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appName.value = packageInfo.appName;
    appVersion.value = packageInfo.version;
    packageName.value = packageInfo.packageName;
    builderNumber.value = packageInfo.buildNumber;
    storeName.value = packageInfo.installerStore ?? 'Unknown'.tr;
  }
}
