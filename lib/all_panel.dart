import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/getter.dart';
import 'controller/home_page/controller.dart';

class AllPanelScreen extends StatefulWidget {
  const AllPanelScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AllPanelScreen> createState() => _AllPanelScreenState();
}

class _AllPanelScreenState extends State<AllPanelScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final controller = Get.put(HomePageController(context: context));
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: GridView.builder(
              itemCount: items.apps.length,
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
                          items.apps[index].icon,
                          width: 56,
                          height: 56,
                        ),
                      ),
                      Text(
                        items.apps[index].title,
                        style: const TextStyle(fontWeight: FontWeight.w700),
                        maxLines: 1,
                      )
                    ],
                  ),
                  onTap: () async {
                    if (controller.connectionStatus.value.name != 'none') {
                      if (items.apps[index].isLock) {
                        securityDialogs.checkPinCodeDialog(
                            items.apps[index].link, items.apps[index].route);
                      } else {
                        route.allPanelRoute(
                            items.apps[index].link, items.apps[index].route);
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
        ),
      ),
    );
  }
}
