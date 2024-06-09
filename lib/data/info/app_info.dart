import 'package:flutter_base_clean_getx_app/core/app_extensions/data_models_extensions/extension_app_version.dart';

import '../../core/core_functions.dart';
import '../../features/versions/domain/entities/app_version_entity/app_version_entity.dart';

class AppInfo {
  static String get appName => 'Base Flutter Clean GetX App';
  static String get appNameInitials => 'BFCGA';
  static String get website => '';

  static AppVersionEntity get appCurrentVersion => const AppVersionEntity(version: '0.0.1');
  static AppVersionEntitiesList get versions => AppVersionEntitiesList().loadFromStorage;
  static int get appVersionsCounter => versions.versionsList.length;

  static String get baseUrl => 'resam-t.ir';
  static String get subDomain => 'basefluttercleangetxapp';

  //FileNames
  static String get fileNameAPK => '${AppInfo.appNameInitials}_android.apk';
  static String get fileNameIPA => '${AppInfo.appNameInitials}_ios.ipa';
  static String get fileNameBackup => '${AppInfo.appNameInitials}_Backup.json';

  ///Core Flags
  static bool get isRelease => true;
  static bool get checkUpdate => false;
}
