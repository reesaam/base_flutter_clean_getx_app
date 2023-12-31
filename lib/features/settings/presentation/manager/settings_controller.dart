import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:get/get.dart';

import '../../../../core/app_extensions/data_types_extensions/extension_locale.dart';
import '../../../../data/info/app_info.dart';
import '../../../../features/settings/presentation/widgets/settings_widgets.dart';
import '../../../../core/app_extensions/data_types_extensions/extension_string.dart';
import '../../../../core/app_localization.dart';
import '../../../../data/storage/app_local_storage.dart';
import '../../../../core/app_extensions/data_models_extensions/extension_settings.dart';
import '../../../../core/core_functions.dart';
import '../../../../core/elements/core_controller.dart';
import '../../../../data/data_models/core_data_models/app_data/app_data.dart';
import '../../../../data/data_models/core_data_models/app_settings_data/app_setting_data.dart';
import '../../../../data/info/app_page_details.dart';
import '../../../../data/resources/app_enums.dart';
import '../../../../data/resources/app_texts.dart';
import '../../../../app/components/main_components/app_dialogs.dart';

class SettingsController extends CoreController {
  Rx<AppSettingData> appSettings = const AppSettingData().obs;

  Rx<bool> darkMode = false.obs;
  Rx<AppLanguages> selectedLanguage = AppLanguages.english.obs;
  Rx<AppCalendarTypes> selectedCalendar = AppCalendarTypes.georgian.obs;

  Rx<String> updateAvailableVersion = AppTexts.generalNotAvailable.obs;

  //Listeners
  late StreamSubscription<AppSettingData> appSettingDataListener;

  @override
  void dataInit() {
    appSettings = const AppSettingData().loadFromStorage.obs;
    AppInfo.checkUpdate ? functionCheckUpdateAvailableVersion() : null;
  }

  @override
  void pageInit() {
    pageDetail = AppPageDetails.settings;
  }

  @override
  void onInitFunction() {
    _fillData();
  }

  @override
  void onCloseFunction() {
    saveSettings();
    appSettingDataListener.cancel();
  }

  _fillData() {
    darkMode.value = appSettings.value.darkMode ?? false;
    appDebugPrint('Fill Setting Data Function Applied Data');
    appSettingDataListener = appSettings.listen((data) => _fillData());
  }

  functionLanguageModal() => AppDialogs.appBottomDialogWithCancel(
        Texts.to.setting_language_modal,
        SettingsWidgets()
            .widgetSelectLanguageForm(functionLanguageSelectionOnTap),
        true,
      );

  functionLanguageSelectionOnTap(int index) {
    AppLocalization.to.setLanguage(AppLocalization.languages[index]);
    selectedLanguage.value = AppLocalization.to.currentLanguage.getLanguage;
    popPage();
    Get.updateLocale(AppLocalization.to.currentLanguage);
    refresh();
  }

  functionDarkModeOnChange(bool value) {
    darkMode.value = value;
    appLogPrint('DarkMode Changed to ${darkMode.value}');
    refresh();
  }

  functionCheckUpdateAvailableVersion() async {
    updateAvailableVersion.value = await checkAvailableVersion();
    appDebugPrint('Checked Update Version: ${updateAvailableVersion.value}');
  }

  functionGoToUpdatePage() => goToPage(AppPageDetails.update);

  functionBackup() {
    function() async {
      popPage();
      AppData appdata = AppLocalStorage.to.exportData();
      var jsonData = jsonEncode(appdata);
      Uint8List data = jsonData.toString().toUInt8List;
      SaveFileDialogParams saveParams = SaveFileDialogParams(
          data: data, fileName: AppTexts.settingBackupFilename);
      String? filePath = await FlutterFileDialog.saveFile(params: saveParams);
      appLogPrint('Backup File Saved');
      appDebugPrint('Filename: ${saveParams.fileName}');
      appDebugPrint('Path: ${saveParams.sourceFilePath}');
      appLogPrint('File Path: $filePath');
    }

    AppDialogs.appAlertDialogWithOkCancel(
        AppTexts.warning, AppTexts.areYouSureDataExport, function, true);
  }

  functionRestore() {
    function() async {
      popPage();
      OpenFileDialogParams openFileParams =
          const OpenFileDialogParams(dialogType: OpenFileDialogType.document);
      String? importFilePath =
          await FlutterFileDialog.pickFile(params: openFileParams);
      appLogPrint('Backup File Selected');
      appLogPrint('File Path: $importFilePath');

      File importFile = File(importFilePath!);
      String stringData = String.fromCharCodes(importFile.readAsBytesSync());
      var jsonData = jsonDecode(stringData) as Map<String, dynamic>;
      AppData appData = AppData.fromJson(jsonData);
      clearAppData();
      AppLocalStorage.to.importData(appData);
      appLogPrint('Data Imported');
    }

    AppDialogs.appAlertDialogWithOkCancel(
        AppTexts.warning, AppTexts.areYouSureDataMayLost, function, true);
  }

  functionClearAllData() {
    function() {
      clearAppData();
      popPage();
      appDebugPrint('');
    }

    AppDialogs.appAlertDialogWithOkCancel(
        AppTexts.warning, AppTexts.areYouSureDataWillLost, function, true);
  }

  saveSettings() {
    appSettings.saveOnStorage;
    appLogPrint('Settings Saved');
  }

  resetAllSettings() {
    appSettings.value = const AppSettingData().clearData;
    saveSettings();
    appLogPrint('Reset Settings Data performed');
  }
}
