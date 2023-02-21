// // 'icon': 'assets/icons/instagram.png',
// // 'title': 'Instagram',
// // 'route': 'InstagramScreen',
// // 'link': 'https://www.instagram.com/',
// // 'isLock': false.obs,
// // 'isPopular': true,
// // 'isSocial': true,
// // 'isMedia': false,
//
// import 'package:get/get.dart';
//
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../controller/getter.dart';

part 'apps.g.dart';

@HiveType(typeId: 2)
class App {
  @HiveField(0)
  int id;
  @HiveField(1)
  String icon;
  @HiveField(2)
  String title;
  @HiveField(3)
  String route;
  @HiveField(4)
  String link;
  @HiveField(5)
  bool isLock;
  @HiveField(6)
  bool isPopular;
  @HiveField(7)
  bool isSocial;
  @HiveField(8)
  bool isMedia;

  App(
      {required this.id,
      required this.icon,
      required this.title,
      required this.route,
      required this.link,
      required this.isLock,
      required this.isPopular,
      required this.isSocial,
      required this.isMedia});
  // App.fromJson(List<Map<dynamic, dynamic>> map, int index) {
  //   id = map[index]['icon'];
  //   icon = map[index]['icon'];
  //   title = map[index]['title'];
  //   route = map[index]['route'];
  //   link = map[index]['link'];
  //   isLock = map[index]['isLock'];
  //   isPopular = map[index]['isPopular'];
  //   isSocial = map[index]['isSocial'];
  //   isMedia = map[index]['isMedia'];
  // }
}

class AppsListClass extends GetxController {
  List<App> apps = [
    App(
      id: 0,
      icon: 'assets/icons/instagram.png',
      title: 'Instagram',
      route: 'InstagramScreen',
      link: 'https://www.instagram.com/',
      isLock: false,
      isPopular: true,
      isSocial: true,
      isMedia: false,
    ),
    App(
      id: 1,
      icon: 'assets/icons/facebook.png',
      title: 'Facebook',
      route: 'FacebookScreen',
      link: 'https://m.facebook.com/',
      isLock: false,
      isPopular: true,
      isSocial: true,
      isMedia: false,
    ),
    App(
      id: 2,
      icon: 'assets/icons/twitter.png',
      title: 'Twitter',
      route: 'TwitterScreen',
      link: 'https://twitter.com/',
      isLock: false,
      isPopular: true,
      isSocial: true,
      isMedia: false,
    ),
    App(
      id: 3,
      icon: 'assets/icons/pinterest.png',
      title: 'Pinterest',
      route: 'PinterestScreen',
      link: 'https://www.pinterest.com/',
      isLock: false,
      isPopular: true,
      isSocial: true,
      isMedia: true,
    ),
    App(
      id: 4,
      icon: 'assets/icons/vk.png',
      title: 'ВКонтакте',
      route: 'vkScreen',
      link: 'https://m.vk.com/',
      isLock: false,
      isPopular: true,
      isSocial: true,
      isMedia: false,
    ),
    App(
      id: 5,
      icon: 'assets/icons/linkedin.png',
      title: 'LinkedIn',
      route: 'LinkedInScreen',
      link: 'https://www.linkedin.com/',
      isLock: false,
      isPopular: true,
      isSocial: true,
      isMedia: false,
    ),
    App(
      id: 6,
      icon: 'assets/icons/reddit.png',
      title: 'Reddit',
      route: 'RedditScreen',
      link: 'https://www.reddit.com/',
      isLock: false,
      isPopular: false,
      isSocial: true,
      isMedia: false,
    ),
    App(
      id: 7,
      icon: 'assets/icons/tik-tok.png',
      title: 'TikTok',
      route: 'TikTokScreen',
      link: 'https://m.vk.com/',
      isLock: false,
      isPopular: true,
      isSocial: false,
      isMedia: true,
    ),
    App(
      id: 8,
      icon: 'assets/icons/letterboxd.png',
      title: 'Letterboxd',
      route: 'LetterboxdScreen',
      link: 'https://letterboxd.com/',
      isLock: false,
      isPopular: false,
      isSocial: false,
      isMedia: false,
    ),
    App(
      id: 9,
      icon: 'assets/icons/meetup.png',
      title: 'Meetup',
      route: 'MeetupScreen',
      link: 'https://www.meetup.com/',
      isLock: false,
      isPopular: false,
      isSocial: true,
      isMedia: false,
    ),
    // App(
    //   id: 10,
    //   icon: 'assets/icons/youtube.png',
    //   title: 'You Tube',
    //   route: 'YouTubeScreen',
    //   link: 'https://m.youtube.com/',
    //   isLock: false,
    //   isPopular: true,
    //   isSocial: false,
    //   isMedia: true,
    // ),
    App(
      id: 11,
      icon: 'assets/icons/quora.png',
      title: 'Quora',
      route: 'QuoraScreen',
      link: 'https://www.quora.com/',
      isLock: false,
      isPopular: false,
      isSocial: false,
      isMedia: true,
    ),
    App(
      id: 12,
      icon: 'assets/icons/tumblr.png',
      title: 'Tumblr',
      route: 'TumblrScreen',
      link: 'https://www.tumblr.com/',
      isLock: false,
      isPopular: false,
      isSocial: true,
      isMedia: false,
    ),
    App(
      id: 13,
      icon: 'assets/icons/flickr.png',
      title: 'Flickr',
      route: 'FlickrScreen',
      link: 'https://www.flickr.com/',
      isLock: false,
      isPopular: false,
      isSocial: false,
      isMedia: true,
    ),
    App(
      id: 14,
      icon: 'assets/icons/bigoLive.png',
      title: 'Bigo Live',
      route: 'BigoLiveScreen',
      link: 'https://www.bigo.tv/',
      isLock: false,
      isPopular: false,
      isSocial: false,
      isMedia: true,
    ),
    App(
      id: 15,
      icon: 'assets/icons/Likee.png',
      title: 'Likee',
      route: 'LikeeScreen',
      link: 'https://likee.video/',
      isLock: false,
      isPopular: true,
      isSocial: false,
      isMedia: true,
    ),
  ].obs;

  void setIsLock(int index, bool value) {
    apps[index].isLock = value;
    storageController.openBox().then((value) {
      storageController
          .addAppToAppsList(value, items.apps[index])
          .whenComplete(() => value.close());
    });
    update();
  }
}
