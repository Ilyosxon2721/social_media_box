import 'package:get/get.dart';
import 'package:social_media_box/screens/settings/info/info.dart';
import 'package:social_media_box/screens/settings/languages.dart';
import 'package:social_media_box/screens/settings/security/security_screen.dart';
import 'package:social_media_box/screens/settings/settings.dart';
import 'package:social_media_box/screens/settings/themes/themes_screen.dart';

import '../home_page.dart';
import '../screens/bigolive.dart';
import '../screens/facebook.dart';
import '../screens/flickr.dart';
import '../screens/instagram.dart';
import '../screens/letterboxd.dart';
import '../screens/likee.dart';
import '../screens/linkedin.dart';
import '../screens/meetup.dart';
import '../screens/pinterest.dart';
import '../screens/quora.dart';
import '../screens/reddit.dart';
import '../screens/tiktok.dart';
import '../screens/tumblr.dart';
import '../screens/twitter.dart';
import '../screens/vk.dart';
import '../screens/youtube.dart';

class Routes {
  //android
  static String home = '/';
  static String instagram = '/instagram';
  static String facebook = '/facebook';
  static String twitter = '/twitter';
  static String pinterest = '/pinterest';
  static String vkontakte = '/vkontakte';
  static String linkedin = '/linkedin';
  static String reddit = '/reddit';
  static String tiktok = '/tiktok';
  static String letterboxd = '/letterboxd';
  static String meetup = '/meetup';
  static String youtube = '/youtube';
  static String quora = '/quora';
  static String tumblr = '/tumblr';
  static String flickr = '/flickr';
  static String bigolive = '/bigolive';
  static String likee = '/likee';
  static String settings = '/settings';
  static String security = '/security';
  static String languages = '/languages';
  static String info = '/info';
  static String themes = '/themes';
  static String webView = '/webView';
  //android
  static String getHomeScreen() => home;
  static String getInstagramScreen() => instagram;
  static String getFacebookScreen() => facebook;
  static String getTwitterScreen() => twitter;
  static String getPinterestScreen() => pinterest;
  static String getVkScreen() => vkontakte;
  static String getLinkedinScreen() => linkedin;
  static String getRedditScreen() => reddit;
  static String getTikTokScreen() => tiktok;
  static String getLetterBoxdScreen() => letterboxd;
  static String getMeetUpScreen() => meetup;
  static String getYouTubeScreen() => youtube;
  static String getQuoraScreen() => quora;
  static String getTumblrScreen() => tumblr;
  static String getFlickrScreen() => flickr;
  static String getBigoLiveScreen() => bigolive;
  static String getLikeeScreen() => likee;
  static String getSettingsScreen() => settings;
  static String getSecurityScreen() => security;
  static String getLanguagesScreen() => languages;
  static String getInfoScreen() => info;
  static String getThemesScreen() => themes;
  static String getWebViewScreen() => webView;

  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => const HomePage(),
      transition: Transition.size,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: instagram,
      page: () => const InstagramScreen(),
      transition: Transition.circularReveal,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: facebook,
      page: () => const FacebookScreen(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: twitter,
      page: () => const TwitterScreen(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: pinterest,
      page: () => const PinterestScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: vkontakte,
      page: () => const VKScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: linkedin,
      page: () => const LinkedinScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: reddit,
      page: () => const RedditScreen(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: tiktok,
      page: () => const TiktokScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: letterboxd,
      page: () => const LetterboxdScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: meetup,
      page: () => const MeetupScreen(),
      transition: Transition.noTransition,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: youtube,
      page: () => const YouTubeScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: quora,
      page: () => const QuoraScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: tumblr,
      page: () => const TumblrScreen(),
      transition: Transition.size,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: flickr,
      page: () => const FlickrScreen(),
      transition: Transition.topLevel,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: bigolive,
      page: () => const BigoLiveScreen(),
      transition: Transition.upToDown,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: likee,
      page: () => const LikeeScreen(),
      transition: Transition.zoom,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: settings,
      page: () => const SettingsScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: security,
      page: () => const SecurityScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: languages,
      page: () => const LanguagesScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: info,
      page: () => const InfoScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: themes,
      page: () => const ThemesScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),
  ];
}
