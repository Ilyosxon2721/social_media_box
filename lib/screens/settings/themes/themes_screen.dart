import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_box/res/assets_res.dart';

class ThemesScreen extends StatelessWidget {
  const ThemesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Themes'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
          children: [
            InkWell(
              onTap: () {
                Get.changeThemeMode(ThemeMode.system);
                Timer(const Duration(milliseconds: 300), () {
                  Get.snackbar('Success'.tr, 'Theme is set by default'.tr);
                });
              },
              child: Card(
                elevation: 2.0,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          AssetsRes.SYSTEM,
                          width: MediaQuery.of(context).size.width / 3.5,
                          height: MediaQuery.of(context).size.width / 3.5,
                        ),
                      ),
                    ),
                    const Divider(),
                    Text('System'.tr)
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.changeThemeMode(ThemeMode.light);
                Timer(const Duration(milliseconds: 300), () {
                  Get.snackbar('Success'.tr, 'Theme is set by default'.tr);
                });
              },
              child: Card(
                elevation: 2.0,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          AssetsRes.DAY,
                          width: MediaQuery.of(context).size.width / 3.5,
                          height: MediaQuery.of(context).size.width / 3.5,
                        ),
                      ),
                    ),
                    const Divider(),
                    Text('Light'.tr)
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.changeThemeMode(ThemeMode.dark);
                Timer(const Duration(milliseconds: 300), () {
                  Get.snackbar('Success'.tr, 'Theme is set by default'.tr);
                });
              },
              child: Card(
                elevation: 2.0,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          AssetsRes.NIGHT,
                          width: MediaQuery.of(context).size.width / 3.5,
                          height: MediaQuery.of(context).size.width / 3.5,
                        ),
                      ),
                    ),
                    const Divider(),
                    Text('Dark'.tr)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
