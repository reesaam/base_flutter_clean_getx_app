import 'dart:async';
import 'package:get/get.dart';

import '../../../../core/app_extensions/data_models_extensions/extension_settings.dart';
import '../../../../app/components/dialogs/app_bottom_dialogs.dart';
import '../../../../core/app_extensions/data_types_extensions/extension_app_languages.dart';
import '../../../../core/app_extensions/data_types_extensions/extension_locale.dart';
import '../../../../core/app_routing/routing.dart';
import '../../../../data/info/app_info.dart';
import '../../../../core/app_localization.dart';
import '../../../../data/storage/app_local_storage.dart';
import '../../../../core/core_functions.dart';
import '../../../../core/elements/core_controller.dart';
import '../../../../data/info/app_page_details.dart';
import '../../../../data/resources/app_enums.dart';
import '../../../../app/components/dialogs/app_alert_dialogs.dart';
import '../../domain/entities/app_settings_data_entity/app_setting_data_entity.dart';
import '../widgets/settings_languages_widgets.dart';

class SettingsController extends CoreController {
  Rx<AppSettingDataEntity> appSettings = const AppSettingDataEntity().obs;

  Rx<bool> darkMode = false.obs;
  Rx<AppLanguages> selectedLanguage = AppLanguages.english.obs;

  Rx<String> updateAvailableVersion = Texts.to.notAvailable.obs;

  //Listeners
  late StreamSubscription<AppSettingDataEntity> appSettingDataListener;

  @override
  void dataInit() {
    appSettings = const AppSettingDataEntity().loadFromStorage.obs;
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
    darkMode.close();
    selectedLanguage.close();
    updateAvailableVersion.close();
  }

  _fillData() {
    darkMode.value = appSettings.value.darkMode;
    selectedLanguage.value = appSettings.value.language;
    appDebugPrint('Fill Setting Data Function Applied Data');
    appSettingDataListener = appSettings.listen((data) => _fillData());
  }

  functionLanguageModal() =>
      AppBottomDialogs().withCancel(title: Texts.to.settingsLanguageModalSelectLanguage, form: SettingsLanguageWidget(function: functionLanguageSelectionOnTap), dismissible: true);

  functionLanguageSelectionOnTap(int index) {
    selectedLanguage.value = AppLocalization.languages[index].getLanguage;
    appSettings.changeLanguage(selectedLanguage.value);
    saveSettings();
    popPage();
    Get.updateLocale(selectedLanguage.value.getLocale);
    Get.reloadAll();
  }

  functionDarkModeOnChange(bool value) {
    darkMode.value = value;
    saveSettings();
    appLogPrint('DarkMode Changed to ${darkMode.value}');
    Get.reloadAll();
    refresh();
    update();
  }

  functionCheckUpdateAvailableVersion() async {
    updateAvailableVersion.value = await checkAvailableVersion();
    appLogPrint('Checked Update Version: ${updateAvailableVersion.value}');
  }

  functionGoToUpdatePage() => goToUpdatePage();

  functionBackup() {
    function() async {
      popPage();
      await AppLocalStorage().exportData();
    }

    AppAlertDialogs().withOkCancel(title: Texts.to.warning, text: Texts.to.areYouSureDataExport, onTapOk: function, dismissible: true);
  }

  functionRestore() {
    function() async {
      popPage();
      await AppLocalStorage.to.importData();
    }

    AppAlertDialogs().withOkCancel(title: Texts.to.warning, text: Texts.to.areYouSureDataMayLost, onTapOk: function, dismissible: true);
  }

  _clearAllDataFunction() {
    popPage();
    clearAppData();
    Get.reloadAll();
    refresh();
  }

  clearAllData() => AppAlertDialogs().withOkCancel(title: Texts.to.warning, text: Texts.to.areYouSureDataWillLost, onTapOk: _clearAllDataFunction, dismissible: true);

  _clearAllSettingsFunction() {
    popPage();
    const AppSettingDataEntity().clearData;
    Get.reloadAll();
    refresh();
  }

  resetAllSettings() => AppAlertDialogs().withOkCancel(title: Texts.to.warning, text: Texts.to.areYouSureDataWillLost, onTapOk: _clearAllSettingsFunction, dismissible: true);

  saveSettings() => saveAppData();
}
