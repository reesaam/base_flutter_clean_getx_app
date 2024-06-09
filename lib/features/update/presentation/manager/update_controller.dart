import 'dart:io';

import 'package:get/get.dart';
import 'package:open_file_plus/open_file_plus.dart' as file_plus;
import 'package:path_provider/path_provider.dart';

import '../../../../core/app_extensions/data_types_extensions/extension_string.dart';
import '../../../../app/components/dialogs/app_bottom_dialogs.dart';
import '../../../../app/functional_components/connectivity/connectivity.dart';
import '../../../../core/app_localization.dart';
import '../../../../core/core_dialogs.dart';
import '../../../../features/update/domain/use_cases/update_download_address_usecase.dart';
import '../../../../features/update/domain/use_cases/update_download_usecase.dart';
import '../../../../core/core_functions.dart';
import '../../../../core/elements/core_controller.dart';
import '../../../../data/info/app_info.dart';
import '../../../../data/info/app_page_details.dart';
import '../../../../data/resources/app_texts.dart';
import '../../../../app/components/general_widgets/app_progress_indicator.dart';
import '../../../../app/components/general_widgets/app_snack_bars.dart';
import '../../../../app/components/dialogs/app_alert_dialogs.dart';

class UpdateController extends CoreController {
  final UpdateDownloadAddressUseCase _updateDownloadAddressUseCase = UpdateDownloadAddressUseCase(updateRepository: Get.find());
  final UpdateDownloadUseCase _updateDownloadUseCase = UpdateDownloadUseCase(updateRepository: Get.find());

  Rx<String> availableVersion = Texts.to.notAvailable.obs;

  File? dlFile;
  Directory? dlDir;

  Rx<bool> downloaded = false.obs;

  @override
  void dataInit() {
    // clearAppData();
  }

  @override
  void pageInit() {
    pageDetail = AppPageDetails.update;
  }

  @override
  void onInitFunction() {
    downloaded.listen((data) {}).onData((data) => data == true ? popPage() : null);
  }

  @override
  void onReadyFunction() async {
    AppInfo.checkUpdate ? await checkUpdate() : null;
  }

  checkUpdate() async {
    AppBottomDialogs().withoutButton(title: Texts.to.updateCheckingUpdate, form: AppProgressIndicator.linear());
    bool internetStatus = await ConnectionChecker.to.checkInternet();
    // internetStatus ? await _checkUpdateFunction() : noInternetConnectionSnackBar();
    await _checkUpdateFunction();
  }

  Future<void> _checkUpdateFunction() async {
    String version = await checkAvailableVersion();
    popPage();
    if (version == AppInfo.appCurrentVersion.version || version == Texts.to.notAvailable) {
      appLogPrint('No New Version Available');
      AppSnackBar().showSnackBar(message: Texts.to.updateNoUpdateFound);
    } else {
      appLogPrint('Available Version: $version');
      availableVersion.value = version;
      AppSnackBar().showSnackBar(message: '${Texts.to.updateUpdateFound}\n${Texts.to.version.withDoubleDots} $version');
    }
  }

  downloadUpdate() async {
    AppBottomDialogs().withoutButton(title: Texts.to.updateDownloading, form: AppProgressIndicator.linear());
    bool internetStatus = await ConnectionChecker.to.checkInternet();
    internetStatus ? _downloadAction() : noInternetConnectionSnackBar();
  }

  _downloadAction() async {
    dlDir = await getExternalStorageDirectory();
    if (dlDir != null) {
      dlFile = File('${dlDir!.path}/${AppTexts.updateAppFilename}');
    }

    if (dlDir != null && dlFile != null) {
      dlFile!.existsSync() ? dlFile!.deleteSync() : null;
      downloaded.value = false;
      String downloadAddress = '';
      final resultAddress = await _updateDownloadAddressUseCase.call();
      resultAddress.fold((l) => showErrorDialog(message: l.toString()), (r) => downloadAddress = r);

      if (downloadAddress.isNotEmpty) {
        final result = await _updateDownloadUseCase.call(dlFile!.path);
        result.fold((l) => showErrorDialog(message: l.toString()), (r) {
          dlFile = r;
          downloaded.value = true;
          appDebugPrint(dlFile?.length());
          AppSnackBar().showSnackBar(message: Texts.to.updateDownloaded);
          AppAlertDialogs().withOkCancel(title: Texts.to.updateInstallationTitle, text: Texts.to.updateInstallationContent, onTapOk: _installUpdate, dismissible: true);
        });
      }
    } else {
      _alertDirectoryOrFileNotFound(dlDir == null);
    }
  }

  void _installUpdate() => dlFile == null ? _alertDirectoryOrFileNotFound(false) : file_plus.OpenFile.open(dlFile!.path);

  _alertDirectoryOrFileNotFound(bool directoryError) => showErrorDialog(
      title: directoryError ? Texts.to.updateDirectoryNotFoundTitle : Texts.to.updateFileNotFoundTitle,
      message: directoryError ? Texts.to.updateDirectoryNotFoundContent : Texts.to.updateFileNotFoundContent);

  checkAvailableUpdate() => availableVersion.value == AppInfo.appCurrentVersion.version || availableVersion.value == Texts.to.notAvailable;
}
