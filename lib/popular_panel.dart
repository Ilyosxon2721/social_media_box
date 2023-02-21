import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/getter.dart';
import 'controller/home_page/controller.dart';

class PopularPanelScreen extends StatefulWidget {
  const PopularPanelScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PopularPanelScreen> createState() => _PopularPanelScreenState();
}

class _PopularPanelScreenState extends State<PopularPanelScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePageController(context: context));
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Obx(() {
          final app =
              items.apps.where((element) => element.isPopular).toList().obs;
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
            // child: GridView.count(
            //   crossAxisCount: width < 500.0 && width > 250.0
            //       ? 4
            //       : width < 600.0 && width > 500.0
            //           ? 5
            //           : width < 1000.0 && width > 800.0
            //               ? 6
            //               : 8,
            //   mainAxisSpacing: 15,
            //   crossAxisSpacing: 15,
            //   physics: const BouncingScrollPhysics(),
            //   shrinkWrap: true,
            //   children: items.allItems
            //       .where((element) => element['isPopular'])
            //       .map((e) => InkWell(
            //             key: ValueKey(e['isPopular'] ? e['title'] : ''),
            //             onTap: () async {
            //               if (controller.connectionStatus.value.name != 'none') {
            //                 if (e['isLock'].value) {
            //                   securityDialogs.checkPinCodeDialog(e);
            //                 } else {
            //                   route.allPanelRoute(e);
            //                 }
            //               } else {
            //                 final snackBar = SnackBar(
            //                   /// need to set following properties for best effect of awesome_snackbar_content
            //                   elevation: 0,
            //                   behavior: SnackBarBehavior.floating,
            //                   backgroundColor: Colors.transparent,
            //                   content: AwesomeSnackbarContent(
            //                     title: 'Error'.tr,
            //                     message: 'No internet connection! '
            //                             'Please enable internet connection'
            //                         .tr,
            //
            //                     /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
            //                     contentType: ContentType.failure,
            //                   ),
            //                 );
            //                 ScaffoldMessenger.of(context)
            //                   ..hideCurrentSnackBar()
            //                   ..showSnackBar(snackBar);
            //               }
            //             },
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Image.asset(
            //                   e['icon'],
            //                   width: 56,
            //                   height: 56,
            //                 ),
            //                 Text(
            //                   e['title'],
            //                   style: const TextStyle(fontWeight: FontWeight.w700),
            //                 )
            //               ],
            //             ),
            //           ))
            //       .toList(),
            // ),
          );
        }),
      ),
    );
  }
}
