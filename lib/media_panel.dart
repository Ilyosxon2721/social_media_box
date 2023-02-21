import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_box/controller/home_page/controller.dart';

import 'controller/getter.dart';

class MediaPanelScreen extends StatefulWidget {
  const MediaPanelScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MediaPanelScreen> createState() => _MediaPanelScreenState();
}

class _MediaPanelScreenState extends State<MediaPanelScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePageController(context: context));
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Obx(() {
          final app =
              items.apps.where((element) => element.isMedia).toList().obs;
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: GridView.builder(
                itemCount: app.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: width < 500.0 && width > 250.0
                      ? 4
                      : width < 600.0 && width > 500.0
                          ? 5
                          : width < 1000.0 && width > 800.0
                              ? 6
                              : 8,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          child: Image.asset(
                            app[index].icon,
                            width: 56,
                            height: 56,
                          ),
                        ),
                        Text(
                          app[index].title,
                          style: const TextStyle(fontWeight: FontWeight.w700),
                          maxLines: 1,
                        )
                      ],
                    ),
                    onTap: () async {
                      if (controller.connectionStatus.value.name != 'none') {
                        if (app[index].isLock) {
                          securityDialogs.checkPinCodeDialog(
                              app[index].link, app[index].route);
                        } else {
                          route.allPanelRoute(
                              app[index].link, app[index].route);
                        }

                        // Navigator.pushNamed(context, e['route']);
                      } else {
                        final snackBar = SnackBar(
                          /// need to set following properties for best effect of awesome_snackbar_content
                          elevation: 0,
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          content: AwesomeSnackbarContent(
                            title: 'Error'.tr,
                            message: 'No internet connection!'
                                    'Please enable internet connection'
                                .tr,

                            /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                            contentType: ContentType.failure,
                          ),
                        );
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(snackBar);
                      }
                    },
                  );
                }),
          );
        }),
      ),
    );
  }
}
