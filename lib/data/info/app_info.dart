import '../data_entities/core_data_entities/app_version/app_version.dart';
import 'app_versions.dart';

class AppInfo {
  static String get appName => 'Base Flutter Clean GetX App';
  static String get appNameInitials => 'BFCGA';
  static String get website => '';
  static AppVersionsList get versions => appVersions;

  static AppVersion get appCurrentVersion => versions.versionsList.last;
  static int get appVersionsCounter => versions.versionsList.length;

  static String get baseUrl => 'resam-t.ir';
  static String get subDomain => 'basefluttercleangetxapp';
  static String get fileName => '${AppInfo.appNameInitials}_Backup.json';

  ///Core Flags
  static bool get isRelease => true;
  static bool get checkUpdate => false;
}
