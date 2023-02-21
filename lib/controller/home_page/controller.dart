// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:new_version_plus/new_version_plus.dart';

class HomePageController extends GetxController {
  HomePageController({required this.context});
  late BuildContext context;
  Rx<ConnectivityResult> connectionStatus = ConnectivityResult.none.obs;
  Rx<Connectivity> connectivity = Connectivity().obs;
  late StreamSubscription<ConnectivityResult> connectivitySubscription;

  @override
  onInit() {
    getUpdate();
    initConnectivity();

    connectivitySubscription = connectivity.value.onConnectivityChanged
        .listen(_updateConnectionStatus);
    super.onInit();
  }

  @override
  onClose() {
    connectivitySubscription.cancel();
  }

  Future<void> getUpdate() async {
    final newVersion = NewVersionPlus(androidId: 'com.social_media_box');
    Timer(const Duration(milliseconds: 800), () {
      advancedStatusCheck(newVersion);
    });
    // advancedStatusCheck(newVersion);
  }

  advancedStatusCheck(NewVersionPlus newVersion) async {
    final status = await newVersion.getVersionStatus();
    if (status != null) {
      if (status.canUpdate) {
        newVersion.showUpdateDialog(
          context: context,
          versionStatus: status,
          dialogTitle: 'New update',
          dialogText: '''
A new app update has been released.
Do you want to update the app to version ${status.storeVersion} ?
Your version is ${status.localVersion}
          ''',
        );
      }
    } else {}
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await connectivity.value.checkConnectivity();
    } on PlatformException {
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    // if (!mounted) {
    //   return Future.value(null);
    // }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    connectionStatus.value = result;
  }
}
