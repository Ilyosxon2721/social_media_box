import 'package:hive_flutter/hive_flutter.dart';
import 'package:social_media_box/res/storage/apps.dart';

abstract class BaseLocaleStorageRepository {
  Future<Box> openBox();
  Future<Box> openPinBox();
  List<App> getAppsList(Box box);
  String getPinCode(Box box);
  Future<void> addAppToAppsList(Box box, App app);
  Future<void> removeAppFromAppsList(Box box, App app);
  Future<void> clearAppsList(Box box, App app);
}
