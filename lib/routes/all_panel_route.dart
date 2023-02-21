import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:get/get.dart';
import 'package:social_media_box/controller/getter.dart';
import 'package:social_media_box/routes/routes.dart';

class AllPanelRouteClass extends GetxController {
  void allPanelRoute(String uri, String route) async {
    final link = screenControl.setUri(Uri.parse(uri));
    // if (e['route'] != 'app') {
    //   screenControl.setUri(Uri.parse(e['link']));
    //   Get.toNamed(Routes.getWebViewScreen());
    // } else {
    //   await LaunchApp.openApp(androidPackageName: e['link'], openStore: false);
    // }
    switch (route) {
      case 'InstagramScreen':
        link;
        Get.toNamed(Routes.getInstagramScreen());
        break;
      case 'FacebookScreen':
        link;
        Get.toNamed(Routes.getFacebookScreen());
        break;
      case 'TwitterScreen':
        link;
        Get.toNamed(Routes.getTwitterScreen());
        break;
      case 'PinterestScreen':
        link;
        Get.toNamed(Routes.getPinterestScreen());
        break;
      case 'vkScreen':
        link;
        Get.toNamed(Routes.getVkScreen());
        break;
      case 'LinkedInScreen':
        link;
        Get.toNamed(Routes.getLinkedinScreen());
        break;
      case 'RedditScreen':
        link;
        Get.toNamed(Routes.getRedditScreen());
        break;
      case 'TikTokScreen':
        link;
        Get.toNamed(Routes.getTikTokScreen());
        break;
      case 'LetterboxdScreen':
        link;
        Get.toNamed(Routes.getLetterBoxdScreen());
        break;
      case 'MeetupScreen':
        link;
        Get.toNamed(Routes.getMeetUpScreen());
        break;
      case 'YouTubeScreen':
        link;
        Get.toNamed(Routes.getYouTubeScreen());
        break;
      case 'QuoraScreen':
        link;
        Get.toNamed(Routes.getQuoraScreen());
        break;
      case 'TumblrScreen':
        link;
        Get.toNamed(Routes.getTumblrScreen());
        break;
      case 'FlickrScreen':
        link;
        Get.toNamed(Routes.getFlickrScreen());
        break;
      case 'BigoLiveScreen':
        link;
        Get.toNamed(Routes.getBigoLiveScreen());
        break;
      case 'LikeeScreen':
        link;
        Get.toNamed(Routes.getLikeeScreen());
        break;
      case 'app':
        await LaunchApp.openApp(androidPackageName: uri, openStore: false);
        break;
      default:
    }
  }
}
