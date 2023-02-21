import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthController extends GetxController {
  final LocalAuthentication auth = LocalAuthentication();
  RxBool canAuthenticateWithBiometrics = false.obs;
  RxBool canAuthenticate = false.obs;
  RxList<BiometricType> availableBiometrics = <BiometricType>[].obs;
  @override
  void onInit() {
    canBiometrics();
    super.onInit();
  }

  void canBiometrics() async {
    canAuthenticateWithBiometrics.value = await auth.canCheckBiometrics;
    canAuthenticate.value =
        canAuthenticateWithBiometrics.value || await auth.isDeviceSupported();
  }

  void checkBiometrics() async {
    availableBiometrics.value = await auth.getAvailableBiometrics();

    if (availableBiometrics.isNotEmpty) {}

    if (availableBiometrics.contains(BiometricType.strong) ||
        availableBiometrics.contains(BiometricType.face)) {}
  }
}
