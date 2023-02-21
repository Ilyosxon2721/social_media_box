import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:social_media_box/controller/getter.dart';
import 'package:social_media_box/res/assets_res.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Info'.tr),
      ),
      body: Column(
        children: [
          Obx(() {
            return Center(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      AssetsRes.APPS,
                      width: 125,
                      height: 125,
                    ),
                  ),
                  Text(
                    infos.appName.value,
                    textScaleFactor: 1.8,
                  ),
                  Text(
                    'Version'.trParams(
                      {'version': infos.appVersion.value},
                    ),
                  ),
                  Text(
                    'Store'.trParams(
                      {'store': infos.storeName.value},
                    ),
                  ),
                ],
              ),
            );
          }),
          Obx(() {
            return Padding(
              padding:
                  const EdgeInsets.only(left: 25, right: 25, top: 8, bottom: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(50, 20),
                  maximumSize: Size(MediaQuery.of(context).size.width - 50,
                      MediaQuery.of(context).size.height * 0.40),
                ),
                onPressed: () {
                  updateApp.checkForUpdate();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: updateApp.progress.value
                      ? const CircularProgressIndicator()
                      : Text(updateApp.updateInfo.value.updateAvailability ==
                              UpdateAvailability.updateAvailable
                          ? "Update".tr
                          : "Check for update".tr),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
