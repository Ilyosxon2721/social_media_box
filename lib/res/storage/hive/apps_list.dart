import 'package:hive/hive.dart';

import '../apps.dart';

part 'apps_list.g.dart';

@HiveType(typeId: 1)
class Apps {
  @HiveField(0)
  late List<App> appsList;
}
