import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_base_clean_getx_app/core/failures/local_exception.dart';
import 'package:get/get.dart';

import '../../features/versions/data/models/app_version_model/app_version_model.dart';
import '../../features/versions/domain/entities/app_version_entity/app_version_mapper.dart';
import '../../data/info/app_info.dart';
import '../../core/app_extensions/data_types_extensions/extension_string.dart';
import '../../app/functional_components/file_functions/file_functions.dart';
import '../../core/app_localization.dart';
import '../../core/core_functions.dart';
import '../../features/settings/data/models/app_settings_data_model/app_setting_data_model.dart';
import '../data_models/app_data_model/app_data_model.dart';
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
  final _keyAppVersions = AppStorageKeys.keyAppVersions.name;
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
  Future<Either<LocalException, bool>> _saveFunction({required String key, data}) async {
    try {
      data == null ? null : await _storage.write(key, data);
      return const Right(true);
    } on LocalException catch (ex) {
      return Left(LocalException.handleResponse(ex));
    } catch (ex) {
      return Left(LocalException.handleResponse(ex));
    }
  }

  Either<LocalException, T> _loadFunction<T>(String key) {
    try {
      T data = _storage.read(key);
      return Right(data);
    } on LocalException catch (ex) {
      return Left(LocalException.handleResponse(ex));
    } catch (ex) {
      return Left(LocalException.handleResponse(ex));
    }
  }

  Future<void> saveAllDataToStorage() async {
    //Load data
    AppDataVersions? appDataVersion = loadAppDataVersion().fold((l) => null, (r) => r);
    AppVersionModelsList? appVersions = loadAppVersions().fold((l) => null, (r) => r);
    AppSettingDataModel? settings = loadSettings().fold((l) => null, (r) => r);

    //Fill Data
    AppDataModel appData = AppDataModel(
      version: appDataVersion,
      appVersions: appVersions,
      settings: settings,
    );

    AppSharedPreferences.to.saveData(appData);
    appLogPrint('AppData Saved to Storage Successfully');
  }

  void loadAllDataFromStorage() async {
    AppDataModel? appData = await AppSharedPreferences.to.loadData();

    if (appData != null) {
      saveAppDataVersion(appDataVersion: appData.version);
      saveAppVersions(appVersions: appData.appVersions);
      saveSettings(settings: appData.settings);
    }

    appLogPrint('AppData Loaded from Storage Successfully');
  }

  ///Manage Data
  Future<void> exportData() async {
    AppDataModel appData = AppDataModel(
      version: AppDataVersions.values.last,
      appVersions: AppInfo.versions.mapper,
      settings: loadSettings().fold((l) => null, (r) => r),
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

    appLogPrint('App Version: ${data.appVersions?.versionsList.last.version ?? unknown}');
    detailsIncluded == true ? appLogPrint('App Version Type: ${data.appVersions?.versionsList.last.versionType ?? unknown}') : null;
    appLogPrint('App Data Type: ${data.version?.number ?? unknown}');

    detailsIncluded == true ? appLogPrint('Settings / Dark Mode: ${data.settings?.darkMode}') : null;
    detailsIncluded == true ? appLogPrint('Settings / Language: ${data.settings?.language.languageName}') : null;
  }

  ///AppData
  Future<void> saveAppDataVersion({required AppDataVersions? appDataVersion}) async => await _saveFunction(key: _keyAppDataVersion, data: appDataVersion);
  Either<LocalException, AppDataVersions> loadAppDataVersion() => _loadFunction(_keyAppDataVersion).map((r) => r == null ? null : jsonDecode(r));
  clearAppDataVersion() => _clearSpecificKey(AppStorageKeys.keyAppDataVersion);

  ///AppVersion
  Future<void> saveAppVersions({required AppVersionModelsList? appVersions}) async => await _saveFunction(key: _keyAppVersions, data: appVersions);
  Either<LocalException, AppVersionModelsList> loadAppVersions() => _loadFunction(_keyAppVersions).map((r) => r == null ? AppVersionModelsList() : AppVersionModelsList.fromJson(r));
  clearAppVersion() => _clearSpecificKey(AppStorageKeys.keyAppVersions);

  ///Settings
  Future<void> saveSettings({required AppSettingDataModel? settings}) async => await _saveFunction(key: _keySettings, data: settings);
  Either<LocalException, AppSettingDataModel> loadSettings() => _loadFunction(_keySettings).map((r) => r == null ? AppSettingDataModel.createEmpty() : AppSettingDataModel.fromJson(r));
  clearSettings() => _clearSpecificKey(AppStorageKeys.keySettings);
}
