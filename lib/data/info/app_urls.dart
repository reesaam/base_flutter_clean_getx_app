import '../resources/app_enums.dart';
import 'app_info.dart';

class AppURLs {
  //Main
  static String get apiBaseUrl => 'flutterbaseprojectgetx.resam-t.ir';
  static String get apiRetoolBaseUrl => 'resam.retool.com/werewolf';
  static String get apiVersion => APIVersions.v1.getValue;
  static String get apiUrl => 'https://$apiRetoolBaseUrl/$apiVersion';

  //Version
  static String get sectionUrlVersion => '$apiUrl/${APISections.versions.getValue}';
  static String get appUrlGetVersions => '$sectionUrlVersion/get_versions';

  //Update
  static String get sectionUrlUpdate => '$apiUrl/${APISections.update.getValue}';
  static String get appUrlUpdateAddress => '$sectionUrlUpdate/get_download_address';
  static String get appUrlUpdateAPKDownload => '$sectionUrlUpdate/app_sources/${AppInfo.fileNameAPK}';
}