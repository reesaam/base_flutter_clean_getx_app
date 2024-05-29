import 'package:flutter_base_clean_getx_app/features/versions/domain/entities/app_version_entity/app_version_mapper.dart';
import 'package:get/get.dart';

import '../../../data/storage/app_local_storage.dart';
import '../../../features/versions/data/models/app_version_model/app_version_model.dart';
import '../../../features/versions/domain/entities/app_version_entity/app_version_entity.dart';

extension RxStorage on Rx<AppVersionEntitiesList> {
  get saveOnStorage => value.saveOnStorage;
  Rx<AppVersionEntitiesList> get loadFromStorage => value.loadFromStorage.obs;
}

extension Storage on AppVersionEntitiesList {
  get saveOnStorage async => await AppLocalStorage.to.saveAppVersions(appVersions: mapper);
  AppVersionEntitiesList get loadFromStorage => AppLocalStorage.to.loadAppVersions().fold((l) => AppVersionEntitiesList(), (r) => r.mapper);
}

extension RxClearEntity on Rx<AppVersionEntitiesList> {
  Rx<AppVersionEntitiesList> get clearData => value.clearData.obs;
}

extension ClearEntity on AppVersionEntitiesList {
  AppVersionEntitiesList get clearData => AppVersionEntitiesList();
}

extension RxStorageModel on Rx<AppVersionModelsList> {
  get saveOnStorage => value.saveOnStorage;
  Rx<AppVersionModelsList> get loadFromStorage => value.loadFromStorage.obs;
}

extension StorageModel on AppVersionModelsList {
  Future<void> get saveOnStorage async => await AppLocalStorage.to.saveAppVersions(appVersions: this);
  AppVersionModelsList get loadFromStorage => AppLocalStorage.to.loadAppVersions().fold((l) => AppVersionModelsList(), (r) => r);
}

extension RxClearModel on Rx<AppVersionModelsList> {
  Rx<AppVersionModelsList> get clearData => value.clearData;
}

extension ClearModel on AppVersionModelsList {
  get clearData => AppVersionModelsList().saveOnStorage;
}
