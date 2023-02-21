// ignore_for_file: avoid_types_as_parameter_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:social_media_box/res/custom_app_bar.dart';
import 'package:social_media_box/res/user_agent.dart';

import '../controller/getter.dart';

class InstagramScreen extends StatelessWidget {
  const InstagramScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // interAds.createInterstitialAd();
    // rewardAndInterAds.createRewardedInterstitialAd();
    // screenControl.loadBannerAd();
    return WillPopScope(
      onWillPop: () => _exitControl(context),
      child: Obx(() {
        return Scaffold(
          floatingActionButton: screenControl.float(),
          appBar: CustomAppBar(
            height: 70,
            child: screenControl.isLoaded.value
                ? AdWidget(
                    ad: screenControl.bannerAd,
                  )
                : const Text(
                    'Instagram',
                    style: TextStyle(
                        fontFamily: 'Fontspring_regular', fontSize: 25),
                  ),
          ),
          body: InAppWebView(
            onWebViewCreated: (controller) {
              screenControl.webViewController.value = controller;
            },
            pullToRefreshController:
                screenControl.pullToRefreshController.value,
            androidOnPermissionRequest: (InAppWebViewController controller,
                String origin, List<String> resources) async {
              return PermissionRequestResponse(
                  resources: resources,
                  action: PermissionRequestResponseAction.GRANT);
            },
            initialUrlRequest: URLRequest(url: screenControl.url.value),
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                allowUniversalAccessFromFileURLs: true,
                allowFileAccessFromFileURLs: true,
                useOnDownloadStart: true,
                userAgent: userAgentFacebook,
                cacheEnabled: true,
                javaScriptEnabled: true,
                useShouldOverrideUrlLoading: true,
                useOnLoadResource: true,
                mediaPlaybackRequiresUserGesture: false,
              ),
              android: AndroidInAppWebViewOptions(
                useHybridComposition: true,
              ),
            ),
            onDownloadStartRequest: (controller, url) async {},
            onProgressChanged: (webViewController, value) {
              screenControl.progress.value = value;
            },
            onLoadStop: (controller, url) {
              screenControl.pullToRefreshController.value.endRefreshing();
            },
            onConsoleMessage: (controller, consoleMessage) {},
            onLoadError: (webViewController, url, int, string) {},
          ),
        );
      }),
    );
  }

  Future<bool> _exitControl(BuildContext context) async {
    switch (await screenControl.webViewController.value.canGoBack()) {
      case true:
        screenControl.webViewController.value.goBack();
        break;
      case false:
        Get.back();
        break;
      default:
    }
    return Future.value(false);
  }
}
