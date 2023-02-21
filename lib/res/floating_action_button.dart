import 'dart:async';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../alerts/screen_alerts/show_dialog.dart';

float(BuildContext context, progress, InAppWebViewController webViewController,
    AnimationController animationController, BannerAd ad, Animation animation) {
  return Padding(
    padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 25),
    child: progress < 100
        ? FloatingActionButton(
            onPressed: () {},
            child: Text('$progress %'),
          )
        : FloatingActionBubble(
// Menu items
            items: <Bubble>[
// Floating action menu item
              Bubble(
                title: "Clear Caches",
                iconColor: Colors.black,
                bubbleColor: Colors.white,
                icon: Icons.cleaning_services_rounded,
                titleStyle: const TextStyle(fontSize: 16, color: Colors.black),
                onPress: () {
                  webViewController
                      .clearCache()
                      .then((value) => Navigator.pop(context));
                },
              ),
              Bubble(
                title: "Page Up",
                iconColor: Colors.black,
                bubbleColor: Colors.white,
                icon: Icons.arrow_upward,
                titleStyle: const TextStyle(fontSize: 16, color: Colors.black),
                onPress: () {
                  webViewController.android.pageUp(top: true);
                },
              ),
              Bubble(
                title: "Page Up",
                iconColor: Colors.black,
                bubbleColor: Colors.white,
                icon: Icons.arrow_downward,
                titleStyle: const TextStyle(fontSize: 16, color: Colors.black),
                onPress: () {
                  webViewController.android.pageDown(bottom: true);
                },
              ),
              Bubble(
                title: "Forward",
                iconColor: Colors.black,
                bubbleColor: Colors.white,
                icon: Icons.arrow_forward_rounded,
                titleStyle: const TextStyle(fontSize: 16, color: Colors.black),
                onPress: () async {
                  if (await webViewController.canGoForward()) {
                    webViewController.goForward();
                  } else {
                    animationController.reverse();
                  }
                },
              ),
              Bubble(
                title: "Screenshot",
                iconColor: Colors.black,
                bubbleColor: Colors.white,
                icon: Icons.camera,
                titleStyle: const TextStyle(fontSize: 16, color: Colors.black),
                onPress: () async {
                  await webViewController.takeScreenshot().then((value) {
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
                title: "Refresh",
                iconColor: Colors.black,
                bubbleColor: Colors.white,
                icon: Icons.refresh_outlined,
                titleStyle: const TextStyle(fontSize: 16, color: Colors.black),
                onPress: () {
                  webViewController.reload();
                },
              ),
//Floating action menu item
              Bubble(
                title: "Home",
                iconColor: Colors.black,
                bubbleColor: Colors.white,
                icon: Icons.home,
                titleStyle: const TextStyle(fontSize: 16, color: Colors.black),
                onPress: () {
                  ad.dispose();
                  Navigator.pop(context);
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
}
