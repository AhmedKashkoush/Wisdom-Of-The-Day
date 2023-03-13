import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:wisdom_of_the_day/Model/Models/wisdom_model.dart';

class WisdomCache {
  static final GetStorage _box = GetStorage();

  static WisdomModel? getWisdom() {
    final String? wisdomString = _box.read<String>('wisdom');
    if (wisdomString == null) return null;
    final Map<String, dynamic> wisdomMap = jsonDecode(wisdomString);
    WisdomModel wisdom = WisdomModel.fromJson(wisdomMap);
    return wisdom;
  }

  static void saveWisdom(WisdomModel wisdom) async {
    Map<String,dynamic> wisdomMap = WisdomModel.toJson(wisdom);
    String wisdomString = jsonEncode(wisdomMap);
    await _box.write('wisdom', wisdomString);
  }
}
