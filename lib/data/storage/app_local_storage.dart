import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../core/app_extensions/data_models_extensions/extension_settings_model.dart';
import '../../../../data/info/app_info.dart';
import '../../../../core/app_extensions/data_types_extensions/extension_string.dart';
import '../../app/functional_components/file_functions/file_functions.dart';
import '../../core/app_localization.dart';
import '../../core/core_functions.dart';
import '../../features/settings/data/models/app_settings_data_model/app_setting_data_model.dart';
import '../data_entities/core_data_entities/app_data/data/models/app_data_model/app_data_model.dart';
import '../data_entities/core_data_entities/app_version/app_version.dart';
import '../resources/app_enums.dart';
import '../resources/app_texts.dart';
import 'app_shared_preferences.dart';
import 'local_storage_service.dart';

class AppLocalStorage {
  final String _keyLocalStorage = 'Local Storage';
  final _storage = LocalStorageService();

  static AppLocalStorage get to => Get.find();

  ///Keys
  final _keyAppData = AppStorageKeys.keyAppData.name;
  final _keyAppDataVersion = AppStorageKeys.keyAppDataVersion.name;
  final _keyAppVersion = AppStorageKeys.keyAppVersion.name;
  final _keySettings = AppStorageKeys.keySettings.name;

  void clearStorage() {
    for (var key in AppStorageKeys.values) {
      _clearSpecificKey(key);
    }
    AppSharedPreferences.to.clearData();
    appLogPrint('All App Data Cleared');
  }

  void _clearSpecificKey(AppStorageKeys key) => _storage.remove(key.name);

  ///Core Functions
  Future<void> _saveFunction({required String key, data}) async => data == null ? null : await _storage.write(key, data);

  dynamic _loadFunction(String key) {
    var data = _storage.read(key);
    return data;
  }

  Future<void> saveAllDataToStorage() async {
    //Load data
    AppDataVersions? appDataVersion = loadAppDataVersion();
    AppVersion? appVersion = loadAppVersion();
    AppSettingDataModel? settings = loadSettings();

    //Fill Data
    AppDataModel appData = AppDataModel(
      version: appDataVersion,
      appVersion: appVersion,
      settings: settings,
    );

    AppSharedPreferences.to.saveData(appData);
    appLogPrint('AppData Saved to Storage Successfully');
  }

  void loadAllDataFromStorage() async {
    AppDataModel? appData = await AppSharedPreferences.to.loadData();

    if (appData != null) {
      saveAppDataVersion(appDataVersion: appData.version);
      saveAppVersion(appVersion: appData.appVersion);
      saveSettings(settings: appData.settings);
    }

    appLogPrint('AppData Loaded from Storage Successfully');
  }

  ///Manage Data
  Future<void> exportData() async {
    AppDataModel appData = AppDataModel(
      version: AppDataVersions.values.last,
      appVersion: AppInfo.appCurrentVersion,
      settings: loadSettings(),
    );

    var appDataJson = json.encode(appData);
    Uint8List data = appDataJson.toString().toUInt8List;
    String? savedPath = await AppFileFunctions.to.saveFile(fileName: AppTexts.settingBackupFilename, data: data);
    appLogPrint('File Path: $savedPath');
    appLogPrint('Backup File Exported');
  }

  Future<void> importData() async {
    var appDataFile = await AppFileFunctions.to.pickFile();
    AppDataModel appData = AppDataModel.fromJson(appDataFile);
    clearAppData();

    ///Filling Data Fields
    if (appData.version == AppDataVersions.values.last) {
      await saveSettings(settings: appData.settings ?? const AppSettingDataModel());
      appLogPrint('Data Imported');
    } else {
      appLogPrint('Data Version is not Compatible, Converter is not Implemented\nData Import Failed');
    }
  }

  void printData({required AppDataModel data, bool? detailsIncluded}) {

    String unknown = Texts.to.notAvailableInitials;

    appLogPrint('App Version: ${data.appVersion?.version ?? unknown}');

    if (detailsIncluded == true) {
      appLogPrint('==> Details:');
      appLogPrint('App Data Version: ${data.version?.number ?? unknown}');
      appLogPrint('App Version Type: ${data.appVersion?.versionType ?? unknown}');
      appLogPrint('Settings / Dark Mode: ${data.settings?.darkMode}');
      appLogPrint('Settings / Language: ${data.settings?.language.languageName}');
    }
  }

  ///AppData
  Future<void> saveAppDataVersion({required AppDataVersions? appDataVersion}) async => await _saveFunction(key: _keyAppDataVersion, data: appDataVersion);

  AppDataVersions? loadAppDataVersion() {
    var data = _loadFunction(_keyAppDataVersion);
    return data == null ? null : jsonDecode(data);
  }

  clearAppDataVersion() => _clearSpecificKey(AppStorageKeys.keyAppDataVersion);

  ///AppVersion
  Future<void> saveAppVersion({required AppVersion? appVersion}) async => await _saveFunction(key: _keyAppVersion, data: appVersion);

  AppVersion? loadAppVersion() {
    var data = _loadFunction(_keyAppVersion);
    return data == null ? null : AppVersion.fromJson(data);
  }

  clearAppVersion() => _clearSpecificKey(AppStorageKeys.keyAppVersion);

  ///Settings
  Future<void> saveSettings({required AppSettingDataModel? settings}) async => await _saveFunction(key: _keySettings, data: settings);

  AppSettingDataModel? loadSettings() {
    var data = _loadFunction(_keySettings);
    return data == null ? null : AppSettingDataModel.fromJson(data);
  }

  clearSettings() => _clearSpecificKey(AppStorageKeys.keySettings);
}
