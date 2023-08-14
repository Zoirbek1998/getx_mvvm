import 'dart:ui';

import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../database/hive_boxes.dart';

class LocalizationService {
  Box box = Hive.box(HiveBoxes.localeBox);

  LocalizationService();

  _setLocale(Locale locale) async {
    await box.put("lang", locale.languageCode);
  }

  set locale(Locale value) {
    if (locale.languageCode != value.languageCode) {
      _setLocale(value);
      Get.locale = value;
      Get.appUpdate();
    }
  }

  Locale get locale => Locale(box.get("lang", defaultValue: "uz"));
}
