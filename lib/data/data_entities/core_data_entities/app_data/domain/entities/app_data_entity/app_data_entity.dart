import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../features/settings/domain/entities/app_settings_data_entity/app_setting_data_entity.dart';
import '../../../../../../resources/app_enums.dart';
import '../../../../app_version/app_version.dart';

part 'app_data_entity.freezed.dart';
part 'app_data_entity.g.dart';

@freezed
class AppDataEntity with _$AppDataEntity {
  const factory AppDataEntity({
    final AppDataVersions? version,
    final AppVersion? appVersion,
    final AppSettingDataEntity? appSettings,
  }) = _AppDataEntity;

  factory AppDataEntity.fromJson(Map<String, dynamic> json) => _$AppDataEntityFromJson(json);
}
