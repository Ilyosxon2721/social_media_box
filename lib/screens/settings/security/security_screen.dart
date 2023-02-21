import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/getter.dart';
import '../../../controller/pinput_controller.dart';
import 'dialogs/dialogs.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({Key? key}) : super(key: key);

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  @override
  Widget build(BuildContext context) {
    final dialog = Get.put(SecurityScreenDialogs());
    final pinCodeController = Get.put(PinCodeControllerClass());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Security'.tr),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                color: Colors.black12,
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: ListTile(
                    leading: const Icon(Icons.fiber_pin_sharp),
                    title: Text('PIN code'.tr),
                    trailing: Obx(
                      () {
                        return ElevatedButton(
                          onPressed: () {
                            dialog.getPinCodeDialog();
                          },
                          child: Text(pinCodeController.pinCode.isNotEmpty
                              ? 'Edit PIN code'.tr
                              : 'Set PIN code'.tr),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: ListView.builder(
                  itemCount: items.apps.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        child: Image.asset(
                          items.apps[index].icon,
                          width: 35,
                          height: 35,
                        ),
                      ),
                      title: Text(
                        items.apps[index].title,
                        style: const TextStyle(fontWeight: FontWeight.w700),
                        maxLines: 1,
                      ),
                      trailing: CupertinoSwitch(
                        value: items.apps[index].isLock,
                        onChanged: (value) {
                          if (value) {
                            if (pinCodeController.pinCode.isNotEmpty) {
                              items.setIsLock(index, value);

                              setState(() {});
                            } else {
                              dialog.errorPinCodeIsNotSet();
                            }
                          } else {
                            items.setIsLock(index, value);
                            setState(() {});
                          }
                        },
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
