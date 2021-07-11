import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:template/config/config.dart';

GetIt sl = GetIt.I;

Future<void> setupLocators() async {
  sl.registerSingleton<BaseConfig>(getConfig());
}

Future<void> initHive() async {
  FlutterSecureStorage storage = FlutterSecureStorage();
  final containsKey = await storage.containsKey(key: 'hive');
  if (!containsKey) {
    var key = Hive.generateSecureKey();
    await storage.write(key: 'hive', value: base64UrlEncode(key));
  }

  await Hive.initFlutter();
}
