import 'package:hive_flutter/hive_flutter.dart';

class Database {
  Database._();
  static final Database instance = Database._();

  static late Box myBox;

  static Future<void> init() async {
    await Hive.initFlutter();
    myBox = await Hive.openBox('user');
  }

  static void write(BoxId id, dynamic value) async {
    switch (id) {
      case BoxId.score:
        myBox.put("score", value);
        break;
      case BoxId.background:
        myBox.put("background", value);
        break;
      case BoxId.bird:
        myBox.put("bird", value);
        break;
      case BoxId.level:
        myBox.put("level", value);
        break;
      case BoxId.audio:
        myBox.put("audio", value);
        break;
    }
  }

  static dynamic read(BoxId id) {
    switch (id) {
      case BoxId.score:
        return myBox.get("score");
      case BoxId.background:
        return myBox.get("background");
      case BoxId.bird:
        return myBox.get("bird");
      case BoxId.level:
        return myBox.get("level");
      case BoxId.audio:
        return myBox.get("audio");
    }
  }
}

enum BoxId {
  score,
  background,
  bird,
  level,
  audio,
}
