import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data_models/app_data_model/app_data_model.dart';
import '../resources/app_enums.dart';

class AppSharedPreferences {
  static AppSharedPreferences get to => Get.find();

  ///Keys
  final _keyAppData = AppStorageKeys.keyAppData.name;

  _saveFunction(data, String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String jsonData = json.encode(data);
    sp.setString(key, jsonData);
  }

  _loadFunction(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? data = sp.getString(key);
    return data == null ? null : json.decode(data);
  }

  void saveData(AppDataModel appData) async {
    _saveFunction(appData, _keyAppData);
  }

  Future<AppDataModel?> loadData() async {
    var jsonAppData = await _loadFunction(_keyAppData);
    return jsonAppData == null ? null : AppDataModel.fromJson(json.decode(jsonAppData));
  }

  void clearData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
  }
}
