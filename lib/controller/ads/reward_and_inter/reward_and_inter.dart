import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardAndInterAdsController extends GetxController {
  RewardedInterstitialAd? rewardedInterstitialAd;
  int numRewardedInterstitialLoadAttempts = 0;
  int maxFailedLoadAttempts = 1;
  void createRewardedInterstitialAd() {
    RewardedInterstitialAd.load(
      adUnitId: 'ca-app-pub-5845328537405791/2970006597',
      request: const AdRequest(),
      rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
        onAdLoaded: (RewardedInterstitialAd ad) {
          rewardedInterstitialAd = ad;
          numRewardedInterstitialLoadAttempts = 0;
        },
        onAdFailedToLoad: (LoadAdError error) {
          rewardedInterstitialAd = null;
          numRewardedInterstitialLoadAttempts += 1;
          if (numRewardedInterstitialLoadAttempts < maxFailedLoadAttempts) {
            createRewardedInterstitialAd();
          }
        },
      ),
    );
  }

  void showRewardedInterstitialAd() {
    if (rewardedInterstitialAd == null) {
      return;
    }
    rewardedInterstitialAd!.fullScreenContentCallback =
        FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedInterstitialAd ad) {},
      onAdDismissedFullScreenContent: (RewardedInterstitialAd ad) {
        ad.dispose();
        createRewardedInterstitialAd();
      },
      onAdFailedToShowFullScreenContent:
          (RewardedInterstitialAd ad, AdError error) {
        ad.dispose();
        createRewardedInterstitialAd();
      },
    );
    rewardedInterstitialAd!.setImmersiveMode(true);
    rewardedInterstitialAd!
        .show(onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {});
    rewardedInterstitialAd = null;
  }
}
