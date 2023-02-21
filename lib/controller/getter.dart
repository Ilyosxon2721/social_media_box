import 'package:get/get.dart';
import 'package:social_media_box/ads_ids.dart';
import 'package:social_media_box/controller/pinput_controller.dart';
import 'package:social_media_box/controller/screens/screens_control.dart';
import 'package:social_media_box/controller/update/update_app.dart';
import 'package:social_media_box/res/storage/apps.dart';

import '../res/assets_res.dart';
import '../res/storage/local_storage_rep.dart';
import '../routes/all_panel_route.dart';
import '../screens/settings/security/dialogs/dialogs.dart';
import 'ads/interstitial/interstitial_ads_controller.dart';
import 'ads/reward_and_inter/reward_and_inter.dart';
import 'get_app_info.dart';

final pinCodeController = Get.put(PinCodeControllerClass());
final route = Get.put(AllPanelRouteClass());
final securityDialogs = Get.put(SecurityScreenDialogs());
final images = Get.put(AssetsRes());
final infos = Get.put(GetAppInfo());
final updateApp = Get.put(UpdateApp());
final interAds = Get.put(InterstitialAdsController());
final rewardAndInterAds = Get.put(RewardAndInterAdsController());
final screenControl = Get.put(ScreenControl());
final adsIds = Get.put(NativeIds());
final items = Get.put(AppsListClass());
final storageController = Get.put(LocalStorageRepository());
