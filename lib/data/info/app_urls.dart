import '../resources/app_enums.dart';
import 'app_info.dart';

class AppURLs {
  //Main
  static String get apiBaseUrl => 'flutterbaseprojectgetx.resam-t.ir';
  static String get apiRetoolBaseUrl => 'resam.retool.com';
  static String get apiVersion => APIVersions.v1.getValue;
  static String get apiUrl => 'https://$apiBaseUrl/$apiVersion';

  //Update
  static String get sectionUrl => '$apiUrl/${APISections.update.getValue}';
  static String get appUrlUpdateVersion => '$sectionUrl/version.txt';
  static String get appUrlUpdateAddress => '$sectionUrl/address.txt';
  static String get appUrlUpdateAPKDownload => '$sectionUrl/app_sources/${AppInfo.fileNameAPK}';
}