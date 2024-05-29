import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../features/settings/data/models/app_settings_data_model/app_setting_data_model.dart';
import '../../../features/versions/data/models/app_version_model/app_version_model.dart';
import '../../resources/app_enums.dart';

part 'app_data_model.freezed.dart';
part 'app_data_model.g.dart';

@freezed
class AppDataModel with _$AppDataModel {
  const factory AppDataModel({
    final AppDataVersions? version,
    final AppVersionModelsList? appVersions,
    final AppSettingDataModel? settings,
  }) = _AppDataModel;

  factory AppDataModel.fromJson(Map<String, dynamic> json) => _$AppDataModelFromJson(json);
}
