import '../../../data/models/app_version_model/app_version_model.dart';
import 'app_version_entity.dart';

extension OnAppVersionEntity on AppVersionEntity {
  AppVersionModel get mapper => AppVersionModel(version: version, versionType: versionType, changes: changes);
}

extension OnAppVersionModel on AppVersionModel {
  AppVersionEntity get mapper => AppVersionEntity(version: version, versionType: versionType, changes: changes);
}

extension OnAppVersionEntityNull on AppVersionEntity? {
  AppVersionModel get mapper => this?.mapper ?? AppVersionModel.createEmpty();
}

extension OnAppVersionModelNull on AppVersionModel? {
  AppVersionEntity get mapper => this?.mapper ?? AppVersionEntity.createEmpty();
}

extension OnAppVersionEntitieList on AppVersionEntitiesList {
  AppVersionModelsList get mapper => AppVersionModelsList(versionsList: versionsList.map((e) => e.mapper).toList());
}

extension OnAppVersionModelsList on AppVersionModelsList {
  AppVersionEntitiesList get mapper => AppVersionEntitiesList(versionsList: versionsList.map((e) => e.mapper).toList());
}