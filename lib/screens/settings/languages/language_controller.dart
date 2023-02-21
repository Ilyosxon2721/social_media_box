import 'package:get/get.dart';

class LanguageController extends GetxController {
  final languageCode = Get.locale!.languageCode;
  final countryCode = Get.locale?.countryCode;
  late RxString currentLang = languageCode.obs;
  void setCurrentLang(String value) {
    currentLang.value = value;
    update();
  }

  @override
  void onInit() {
    final languageCode = Get.locale!.languageCode;
    setCurrentLang(languageCode);
    super.onInit();
  }
}
