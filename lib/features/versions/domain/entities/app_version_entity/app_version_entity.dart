import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data/info/app_info.dart';
import '../../../../../data/resources/app_enums.dart';

part 'app_version_entity.freezed.dart';
part 'app_version_entity.g.dart';

@freezed
class AppVersionEntity with _$AppVersionEntity {
  const factory AppVersionEntity({
    required final String version,
    final List<String>? changes,
    final AppVersionTypes? versionType,
  }) = _AppVersionEntity;

  factory AppVersionEntity.fromJson(Map<String, dynamic> json) => _$AppVersionEntityFromJson(json);

  factory AppVersionEntity.createEmpty() => AppVersionEntity(version: AppInfo.appCurrentVersion.version);
}

@freezed
class AppVersionEntitiesList with _$AppVersionEntitiesList {
  factory AppVersionEntitiesList({@Default(<AppVersionEntity>[]) List<AppVersionEntity> versionsList}) = _AppVersionEntitiesList;

  factory AppVersionEntitiesList.fromJson(Map<String, dynamic> json) => _$AppVersionEntitiesListFromJson(json);
}
