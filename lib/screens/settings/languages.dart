import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'languages/language_controller.dart';

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({Key? key}) : super(key: key);

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Languages'.tr),
      ),
      body: Obx(() {
        final controller = Get.put(LanguageController());
        return Column(
          children: [
            RadioListTile(
              title: const Text('English'),
              value: 'en',
              groupValue: controller.currentLang.value,
              onChanged: (value) {
                Get.updateLocale(const Locale('en', 'US'));
                controller.setCurrentLang(value!);
              },
            ),
            RadioListTile(
              title: const Text('Русский'),
              value: 'ru',
              groupValue: controller.currentLang.value,
              onChanged: (value) {
                Get.updateLocale(const Locale('ru', 'RU'));
                controller.setCurrentLang(value!);
              },
            ),
            RadioListTile(
              title: const Text("Français"),
              value: 'fr',
              groupValue: controller.currentLang.value,
              onChanged: (value) {
                Get.updateLocale(const Locale('fr', 'FRA'));
                controller.setCurrentLang(value!);
              },
            )
          ],
        );
      }),
    );
  }
}
