// ignore_for_file: avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:social_media_box/controller/getter.dart';

import '../res/custom_app_bar.dart';
import '../res/user_agent.dart';

class TumblrScreen extends StatelessWidget {
  const TumblrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // interAds.createInterstitialAd();
    // rewardAndInterAds.createRewardedInterstitialAd();
    // screenControl.loadBannerAd();
    return Obx(() {
      return WillPopScope(
        onWillPop: () => screenControl.exitControl(context),
        child: Scaffold(
          floatingActionButton: screenControl.float(),
          appBar: CustomAppBar(
            height: 70,
            child: screenControl.isLoaded.value
                ? AdWidget(
                    ad: screenControl.bannerAd,
                  )
                : Image.asset(
                    'assets/icons/Tumblr_Logo.png',
                    height: 64,
                    width: 128,
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
        ),
      );
    });
  }
}
