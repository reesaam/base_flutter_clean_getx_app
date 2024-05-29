import 'package:get/get.dart';

import '../../../data/resources/app_enums.dart';
import '../../../data/storage/app_local_storage.dart';
import '../../../features/settings/data/models/app_settings_data_model/app_setting_data_model.dart';
import '../../../features/settings/domain/entities/app_settings_data_entity/app_setting_data_entity.dart';
import '../../../../features/settings/domain/entities/app_settings_data_entity/app_setting_data_mapper.dart';

extension RxStorageEntity on Rx<AppSettingDataEntity> {
  void get saveOnStorage async => await AppLocalStorage.to.saveSettings(settings: value.mapper);
  Rx<AppSettingDataEntity> get loadFromStorage => value.loadFromStorage.obs;
}

extension StorageEntity on AppSettingDataEntity {
  void get saveOnStorage async => await AppLocalStorage.to.saveSettings(settings: mapper);
  AppSettingDataEntity get loadFromStorage => AppLocalStorage.to.loadSettings().fold((l) => AppSettingDataEntity.createEmpty(), (r) => r.mapper);
}

extension RxClearEntity on Rx<AppSettingDataEntity> {
  Rx<AppSettingDataEntity> get clearData => value.clearData.obs;
}

extension ClearEntity on AppSettingDataEntity {
  AppSettingDataEntity get clearData => AppSettingDataEntity.createEmpty();
}

extension RxLanguagesEntity on Rx<AppSettingDataEntity> {
  changeLanguage(AppLanguages language) => value.changeLanguage(language);
}

extension LanguagesEntity on AppSettingDataEntity {
  changeLanguage(AppLanguages lang) => copyWith(language: lang).saveOnStorage;
}

extension RxStorageModel on Rx<AppSettingDataModel> {
  get saveOnStorage => value.saveOnStorage;
  Rx<AppSettingDataModel> get loadFromStorage => value.loadFromStorage.obs;
}

extension StorageModel on AppSettingDataModel {
  Future<void> get saveOnStorage async => await AppLocalStorage.to.saveSettings(settings: this);
  AppSettingDataModel get loadFromStorage => AppLocalStorage.to.loadSettings().fold((l) => AppSettingDataModel.createEmpty(), (r) => r);
}

extension RxClearModel on Rx<AppSettingDataModel> {
  Rx<AppSettingDataModel> get clearData => value.clearData;
}

extension ClearModel on AppSettingDataModel {
  get clearData => AppSettingDataModel.createEmpty().saveOnStorage;
}