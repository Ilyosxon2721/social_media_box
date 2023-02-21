import 'dart:async';
import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../alerts/screen_alerts/show_dialog.dart';
import '../getter.dart';

class ScreenControl extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxInt progress = 0.obs;
  Rx<InAppWebViewController> webViewController =
      InAppWebViewController('', const InAppWebView()).obs;
  late Rx<PullToRefreshController> pullToRefreshController =
      PullToRefreshController(
    options: PullToRefreshOptions(
      color: Colors.blue,
    ),
    onRefresh: () async {
      if (Platform.isAndroid) {
        webViewController.value.reload();
      } else if (Platform.isIOS) {
        webViewController.value.loadUrl(
          urlRequest: URLRequest(
            url: await webViewController.value.getUrl(),
          ),
        );
      }
    },
  ).obs;
  Rx<Uri> url = Uri.parse('').obs;
  void setUri(Uri newUri) {
    url.value = newUri;
    update();
  }

  late Animation<double> animation;
  late AnimationController animationController;
  late BannerAd bannerAd;
  RxBool isLoaded = false.obs;
  @override
  onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );
    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: animationController);
    animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
  }

  Future<bool> exitControl(BuildContext context) async {
    switch (await webViewController.value.canGoBack()) {
      case true:
        webViewController.value.goBack();
        break;
      case false:
        interAds.showInterstitialAd();
        Get.back();
        break;
      default:
    }
    return Future.value(false);
  }

  float() {
    return Builder(builder: (context) {
      return Obx(() {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 25),
          child: progress.value < 100
              ? FloatingActionButton(
                  onPressed: () {},
                  child: Text('${progress.value} %'),
                )
              : FloatingActionBubble(
// Menu items
                  items: <Bubble>[
// Floating action menu item
                    Bubble(
                      title: "Clear Caches".tr,
                      iconColor: Colors.black,
                      bubbleColor: Colors.white,
                      icon: Icons.cleaning_services_rounded,
                      titleStyle:
                          const TextStyle(fontSize: 16, color: Colors.black),
                      onPress: () {
                        webViewController.value
                            .clearCache()
                            .then((value) => animationController.reverse())
                            .catchError((error) =>
                                Get.snackbar('Error'.tr, error.toString()))
                            .whenComplete(
                              () => Get.snackbar(
                                'Success'.tr,
                                'Cache is cleared'.tr,
                              ),
                            );
                      },
                    ),
                    Bubble(
                      title: "Page Up".tr,
                      iconColor: Colors.black,
                      bubbleColor: Colors.white,
                      icon: Icons.arrow_upward,
                      titleStyle:
                          const TextStyle(fontSize: 16, color: Colors.black),
                      onPress: () {
                        webViewController.value.android.pageUp(top: true);
                      },
                    ),
                    Bubble(
                      title: "Page Down".tr,
                      iconColor: Colors.black,
                      bubbleColor: Colors.white,
                      icon: Icons.arrow_downward,
                      titleStyle:
                          const TextStyle(fontSize: 16, color: Colors.black),
                      onPress: () {
                        webViewController.value.android.pageDown(bottom: true);
                      },
                    ),
                    Bubble(
                      title: "Forward".tr,
                      iconColor: Colors.black,
                      bubbleColor: Colors.white,
                      icon: Icons.arrow_forward_rounded,
                      titleStyle:
                          const TextStyle(fontSize: 16, color: Colors.black),
                      onPress: () async {
                        if (await webViewController.value.canGoForward()) {
                          webViewController.value.goForward();
                        } else {
                          animationController.reverse();
                        }
                      },
                    ),
                    Bubble(
                      title: "Screenshot".tr,
                      iconColor: Colors.black,
                      bubbleColor: Colors.white,
                      icon: Icons.camera,
                      titleStyle:
                          const TextStyle(fontSize: 16, color: Colors.black),
                      onPress: () async {
                        animationController.reverse();
                        await webViewController.value
                            .takeScreenshot()
                            .then((value) {
                          if (value != null) {
                            Timer(const Duration(milliseconds: 100), () {
                              showScreenshotDialog(context, value);
                            });
                          }
                        }).catchError((onError) {
                          final snackBar = SnackBar(
                            /// need to set following properties for best effect of awesome_snackbar_content
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              title: 'Error',
                              message: 'Screenshot failed!  $onError',

                              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                              contentType: ContentType.failure,
                            ),
                          );
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);
                        });
                      },
                    ),
                    Bubble(
                      title: "Refresh".tr,
                      iconColor: Colors.black,
                      bubbleColor: Colors.white,
                      icon: Icons.refresh_outlined,
                      titleStyle:
                          const TextStyle(fontSize: 16, color: Colors.black),
                      onPress: () {
                        rewardAndInterAds.showRewardedInterstitialAd();
                        animationController.reverse();
                        webViewController.value.reload();
                      },
                    ),
//Floating action menu item
                    Bubble(
                      title: "Home".tr,
                      iconColor: Colors.black,
                      bubbleColor: Colors.white,
                      icon: Icons.home,
                      titleStyle:
                          const TextStyle(fontSize: 16, color: Colors.black),
                      onPress: () {
                        animationController.reverse();
                        interAds.showInterstitialAd();
                        bannerAd.dispose();
                        Get.back();
                      },
                    ),
                  ],

// animation controller
                  animation: animation,

// On pressed change animation state
                  onPress: () => animationController.isCompleted
                      ? animationController.reverse()
                      : animationController.forward(),

// Floating Action button Icon color
                  iconColor: Colors.black,
                  animatedIconData: AnimatedIcons.menu_close,
                  backGroundColor: Colors.white,
// Flaoting Action button Icon
                ),
        );
      });
    });
  }

  void loadBannerAd() {
    final id = adsIds.banner_id;
    bannerAd = BannerAd(
      adUnitId: id,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(onAdLoaded: (ad) {
        isLoaded.value = true;
      }, onAdFailedToLoad: (ad, error) {
        ad.dispose();
        debugPrint(error.message);
      }),
    );
    bannerAd.load();
  }
}
