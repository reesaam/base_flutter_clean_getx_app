import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data/resources/app_enums.dart';

part 'app_setting_data_entity.freezed.dart';
part 'app_setting_data_entity.g.dart';

@freezed
class AppSettingDataEntity with _$AppSettingDataEntity {
  const factory AppSettingDataEntity({
    @Default(false) bool darkMode,
    @Default(AppLanguages.english) AppLanguages language,
  }) = _AppSettingDataEntity;

  factory AppSettingDataEntity.fromJson(Map<String, dynamic> json) => _$AppSettingDataEntityFromJson(json);

  factory AppSettingDataEntity.createEmpty() => const AppSettingDataEntity(
        language: AppLanguages.english,
        darkMode: false,
      );
}

@unfreezed
class AppSettingDataEntitiesList with _$AppSettingDataEntitiesList {
  factory AppSettingDataEntitiesList({@Default(<AppSettingDataEntity>[]) List<AppSettingDataEntity> appSettingsDataList}) = _AppSettingDataEntitiesList;

  factory AppSettingDataEntitiesList.fromJson(Map<String, dynamic> json) => _$AppSettingDataEntitiesListFromJson(json);
}
