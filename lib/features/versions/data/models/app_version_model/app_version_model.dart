import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../data/info/app_info.dart';
import '../../../../../../data/resources/app_enums.dart';

part 'app_version_model.freezed.dart';
part 'app_version_model.g.dart';

@freezed
class AppVersionModel with _$AppVersionModel {
  const factory AppVersionModel({
    required final String version,
    final List<String>? changes,
    final AppVersionTypes? versionType,
  }) = _AppVersionModel;

  factory AppVersionModel.fromJson(Map<String, dynamic> json) => _$AppVersionModelFromJson(json);

  factory AppVersionModel.createEmpty() => AppVersionModel(version: AppInfo.appCurrentVersion.version);
}

@freezed
class AppVersionModelsList with _$AppVersionModelsList {
  factory AppVersionModelsList({@Default(<AppVersionModel>[]) List<AppVersionModel> versionsList}) = _AppVersionModelsList;

  factory AppVersionModelsList.fromJson(Map<String, dynamic> json) => _$AppVersionModelsListFromJson(json);
}
