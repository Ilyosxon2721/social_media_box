import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_box/controller/home_page/controller.dart';
import 'package:social_media_box/popular_panel.dart';
import 'package:social_media_box/routes/routes.dart';
import 'package:social_media_box/social_panel.dart';

import 'all_panel.dart';
import 'media_panel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//   ConnectivityResult _connectionStatus = ConnectivityResult.none;
//   final Connectivity _connectivity = Connectivity();
//   late StreamSubscription<ConnectivityResult> _connectivitySubscription;
//   final LocalAuthentication auth = LocalAuthentication();
//
//   Future<void> getUpdate() async {
//     final newVersion = NewVersionPlus(androidId: 'com.social_media_box');
//     Timer(const Duration(milliseconds: 800), () {
//       advancedStatusCheck(newVersion);
//     });
//     // advancedStatusCheck(newVersion);
//   }
//
//   advancedStatusCheck(NewVersionPlus newVersion) async {
//     final status = await newVersion.getVersionStatus();
//     if (status != null) {
//       if (status.canUpdate) {
//         debugPrint(status.releaseNotes);
//         debugPrint(status.appStoreLink);
//         debugPrint(status.localVersion);
//         debugPrint(status.storeVersion);
//         debugPrint(status.canUpdate.toString());
//         newVersion.showUpdateDialog(
//           context: context,
//           versionStatus: status,
//           dialogTitle: 'New update',
//           dialogText: '''
// A new app update has been released.
// Do you want to update the app to version ${status.storeVersion} ?
// Your version is ${status.localVersion}
//           ''',
//         );
//       }
//     } else {
//       print(status);
//     }
//   }
//
//   @override
//   void initState() {
//     getUpdate();
//     initConnectivity();
//
//     _connectivitySubscription =
//         _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _connectivitySubscription.cancel();
//     super.dispose();
//   }
//
//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initConnectivity() async {
//     late ConnectivityResult result;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       result = await _connectivity.checkConnectivity();
//     } on PlatformException catch (e) {
//       print('Couldn\'t check connectivity status $e');
//       return;
//     }
//
//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) {
//       return Future.value(null);
//     }
//
//     return _updateConnectionStatus(result);
//   }
//
//   Future<void> _updateConnectionStatus(ConnectivityResult result) async {
//     setState(() {
//       _connectionStatus = result;
//     });
//     print(_connectionStatus.name);
//   }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePageController(context: context));
    final tabPages = <Widget>[
      const Center(
        child: AllPanelScreen(),
      ),
      const Center(
        child: PopularPanelScreen(),
      ),
      const Center(
        child: SocialPanelScreen(),
      ),
      const Center(
        child: MediaPanelScreen(),
      ),
    ];
    final tabs = <Tab>[
      Tab(
        text: 'All'.tr,
      ),
      Tab(
        text: 'Popular'.tr,
      ),
      Tab(
        text: 'Social'.tr,
      ),
      Tab(
        text: 'Media'.tr,
      )
    ];
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                // authController.signInWithGoogle();
                Get.toNamed(Routes.getSettingsScreen());
              },
              icon: const Icon(Icons.settings)),
          title: Text(
            'app_name'.tr,
            // style: TextStyle(color: Colors.black),
          ),
          actions: [
            Obx(() {
              return Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: controller.connectionStatus.value.name == 'none'
                    ? const Icon(
                        Icons.wifi_off,
                        color: Colors.deepOrange,
                      )
                    : controller.connectionStatus.value.name == 'wifi'
                        ? const Icon(
                            Icons.wifi,
                            color: Colors.green,
                          )
                        : controller.connectionStatus.value.name == 'mobile'
                            ? const Icon(
                                Icons.signal_cellular_alt,
                                color: Colors.green,
                              )
                            : Container(),
              );
            }),
          ],
          centerTitle: true,
          elevation: 5,
          bottom: TabBar(
            physics: const BouncingScrollPhysics(),
            tabs: tabs,
          ),
        ),
        body: TabBarView(
            physics: const BouncingScrollPhysics(), children: tabPages),
      ),
    );
  }
}
