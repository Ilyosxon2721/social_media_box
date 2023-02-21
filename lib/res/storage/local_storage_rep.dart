import 'package:hive/hive.dart';
import 'package:social_media_box/abstracts/hive_remote.dart';
import 'package:social_media_box/res/storage/apps.dart';

class LocalStorageRepository extends BaseLocaleStorageRepository {
  final boxName = 'apps_list';
  final pinBoxName = 'pinCode';
  @override
  Future<Box> openBox() async {
    Box box = await Hive.openBox<App>(boxName);
    return box;
  }

  @override
  Future<Box> openPinBox() async {
    Box box = await Hive.openBox(pinBoxName);
    return box;
  }

  @override
  List<App> getAppsList(Box box) {
    print(box.values.toList());
    return box.values.toList() as List<App>;
  }

  @override
  String getPinCode(Box box) {
    return box.getAt(0);
  }

  @override
  Future<void> addAppToAppsList(Box box, App app) async {
    await box.put(app.id, app);
  }

  @override
  Future<void> removeAppFromAppsList(Box box, App app) async {
    await box.delete(app.id);
  }

  @override
  Future<void> clearAppsList(Box box, App app) async {
    await box.clear();
  }
}
