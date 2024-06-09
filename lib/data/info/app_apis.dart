import '../resources/app_enums.dart';
import 'app_info.dart';

class AppAPIs {
  //Main
  // static String get _apiBaseUrl => '${AppInfo.subDomain}.${AppInfo.baseUrl}';
  static String get _apiBaseUrl => 'www.${AppInfo.baseUrl}/${AppInfo.subDomain}';
  static String get _apiVersion => APIVersions.v1.getValue;
  static String get _apiUrl => 'https://$_apiBaseUrl/$_apiVersion';

  //Sections
  static String get _apiSectionVersion => '$_apiUrl/${APISections.versions.getName}';
  static String get _apiSectionUpdate => '$_apiUrl/${APISections.update.getName}';

  //Version
  static String get apiGetVersions => '$_apiSectionVersion/get_versions';

  //Update
  static String get apiGetUpdateAddress => '$_apiSectionUpdate/get_download_address';
  static String get apiGetUpdateAPKDownload => '$apiGetUpdateAddress/${AppInfo.fileNameAPK}';
}