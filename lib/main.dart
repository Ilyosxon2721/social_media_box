import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:social_media_box/controller/getter.dart';
import 'package:social_media_box/res/lang/language.dart';
import 'package:social_media_box/res/storage/apps.dart';
import 'package:social_media_box/res/storage/hive/apps_list.dart';
import 'package:social_media_box/routes/routes.dart';
import 'package:social_media_box/services/local_auth/local_auth_controller.dart';

// List<String> testDevicesIds = [
//   "B1A616EFF5A4B8BD4ED106C35AE6DD34",
//   "EE6894F9C7B05E176DFDE93CF9D8172B",
//   "539BDD74F3872142A083927986CDEFDE",
//   "D298D295EA650AA7EABA6C4B0B6CB94B",
// ];
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterDownloader.initialize(debug: true, ignoreSsl: true);
  await Firebase.initializeApp();
  MobileAds.instance.initialize();
  // RequestConfiguration configuration =
  //     RequestConfiguration(testDeviceIds: testDevicesIds);
  // MobileAds.instance.updateRequestConfiguration(configuration);
  await Hive.initFlutter()
      .whenComplete(() => Hive.registerAdapter(AppsAdapter()))
      .whenComplete(() => Hive.registerAdapter(AppAdapter()))
      .whenComplete(() {
    storageController.openBox().then((value) {
      if (value.isNotEmpty) {
        final result = storageController.getAppsList(value);
        if (result.isNotEmpty) {
          items.apps = result;
        } else {
          for (var i = 0; i < items.apps.length; i++) {
            storageController.addAppToAppsList(value, items.apps[i]);
          }
        }
      } else {
        print('App Box Is Empty');
        for (var i = 0; i < items.apps.length; i++) {
          storageController.addAppToAppsList(value, items.apps[i]);
        }
      }
    });
    storageController.openPinBox().then((value) {
      if (value.isNotEmpty) {
        final result = storageController.getPinCode(value);
        if (result.isNotEmpty) {
          pinCodeController.setPinCode(result);
        } else {}
      }
      value.isOpen ? value.close() : null;
    });
  });

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);

    var swAvailable = await AndroidWebViewFeature.isFeatureSupported(
        AndroidWebViewFeature.SERVICE_WORKER_BASIC_USAGE);
    var swInterceptAvailable = await AndroidWebViewFeature.isFeatureSupported(
        AndroidWebViewFeature.SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST);

    if (swAvailable && swInterceptAvailable) {
      AndroidServiceWorkerController serviceWorkerController =
          AndroidServiceWorkerController.instance();

      await serviceWorkerController
          .setServiceWorkerClient(AndroidServiceWorkerClient(
        shouldInterceptRequest: (request) async {
          return null;
        },
      ));
    }
  }
  Get.put(LocalAuthController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Languages(),
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      darkTheme: ThemeData.dark(useMaterial3: true),
      theme: ThemeData.light(useMaterial3: true)
          .copyWith(tabBarTheme: const TabBarTheme(labelColor: Colors.black54)),
      themeMode: ThemeMode.system,
      initialRoute: Routes.getHomeScreen(),
      getPages: Routes.routes,
    );
  }
}
