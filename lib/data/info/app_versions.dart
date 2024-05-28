
import '../../features/versions/domain/entities/app_version_entity/app_version_entity.dart';
import '../resources/app_enums.dart';

AppVersionEntitiesList get appVersions => AppVersionEntitiesList(
        versionsList: List<AppVersionEntity>.of([
      const AppVersionEntity(version: '0.0.1', changes: [], versionType: AppVersionTypes.beta),
    ]));
