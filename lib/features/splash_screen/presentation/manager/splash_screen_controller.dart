import '../../../../app/components/dialogs/app_alert_dialogs.dart';
import '../../../../app/functional_components/connectivity/connectivity.dart';
import '../../../../app/functional_components/permissions/permissions.dart';
import '../../../../core/app_localization.dart';
import '../../../../core/app_routing/routing.dart';
import '../../../../core/core_functions.dart';
import '../../../../core/elements/core_controller.dart';
import '../../../../data/info/app_info.dart';
import '../../../../data/info/app_page_details.dart';
import '../../../../data/resources/app_logos.dart';

class SplashScreenController extends CoreController {
  late bool internetStatus;
  late String availableUpdate = AppInfo.appCurrentVersion.version;
  late String permissionsStatus;

  late String logoSource;
  late String appName;
  late String appVersion;

  @override
  void dataInit() async {
    // permissionsStatus = await AppPermissions.to.checkAllPermissions();
    // appDebugPrint('Permission Status: $permissionsStatus}');
    // internetStatus = await ConnectionChecker.to.checkInternet();
    // internetStatus ? availableUpdate = await checkAvailableVersion() : noInternetConnectionSnackBar();
    // appDebugPrint('Available Update: $availableUpdate');
    // availableUpdate = await checkAvailableVersion();
  }

  @override
  void pageInit() {
    pageDetail = AppPageDetails.splashScreen;
    logoSource = AppLogos.appLogo;
    appName = AppInfo.appNameInitials;
    appVersion = '${Texts.to.version}: ${AppInfo.appCurrentVersion.version}';
  }

  @override
  void onReadyFunction() {
    goToNextPage();
  }

  void goToNextPage() async {
    await Future.delayed(const Duration(seconds: 4));
    availableUpdate == AppInfo.appCurrentVersion.version ? goToHomePage() : _showUpdateDialog();
  }

  _showUpdateDialog() => AppAlertDialogs().withYesNo(
        title: Texts.to.updateNewVersion,
        text: Texts.to.updateApprove,
        onTapNo: goToHomePage,
        onTapYes: _goToUpdate,
      );

  _goToUpdate() {
    goToHomePage();
    goToUpdatePage();
  }
}
