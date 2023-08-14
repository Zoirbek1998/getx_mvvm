import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart' as hive;
import '../database/hive_boxes.dart';

Future<void> init() async {
  //Hive
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );
  await Hive.initFlutter();
  final secureStorage = FlutterSecureStorage(aOptions: _getAndroidOptions());
  var containsEncryptionKey = await secureStorage.containsKey(key: 'encryptionKey');
  if (!containsEncryptionKey) {
    var key = hive.Hive.generateSecureKey();
    await secureStorage.write(key: "encryptionKey", value: base64UrlEncode(key));
  }
  var encryptionKey = base64Url.decode((await secureStorage.read(key: 'encryptionKey'))!);
  await Hive.openBox(HiveBoxes.localeBox, encryptionCipher: HiveAesCipher(encryptionKey));
  await Hive.openBox(HiveBoxes.tokenBox, encryptionCipher: HiveAesCipher(encryptionKey));

}
