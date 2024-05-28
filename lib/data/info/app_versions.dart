import '../../../../data/resources/app_enums.dart';
import '../data_entities/core_data_entities/app_version/app_version.dart';

AppVersionsList get appVersions => AppVersionsList(
        versionsList: List<AppVersion>.of([
      const AppVersion(version: '0.0.1', changes: [], versionType: AppVersionTypes.beta),
    ]));
