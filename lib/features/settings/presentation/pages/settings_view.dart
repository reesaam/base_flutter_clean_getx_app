import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_extensions/data_types_extensions/extension_string.dart';
import '../../../../core/app_extensions/data_types_extensions/extension_locale.dart';
import '../../../../core/app_extensions/data_types_extensions/extension_app_languages.dart';
import '../../../../core/app_localization.dart';
import '../../../../core/elements/core_view.dart';
import '../../../../data/info/app_info.dart';
import '../../../../app/components/general_widgets/app_popup_menu.dart';
import '../../../../app/components/general_widgets/app_popup_menu_item.dart';
import '../../../../app/components/general_widgets/app_switch.dart';
import '../../../../app/components/main_components/app_bar.dart';
import '../../../../app/components/main_components/app_bottom_navigation_bar.dart';
import '../../../../app/components/main_components/app_drawer.dart';
import '../widgets/settings_sections_items_widgets.dart';
import '../widgets/settings_sections_widgets.dart';
import '../manager/settings_controller.dart';

class SettingsPage extends CoreView<SettingsController> {
  const SettingsPage({super.key});

  @override
  PreferredSizeWidget? get appBar => AppAppBar(pageDetail: controller.pageDetail, barAction: _widgetAppbarThreeDotsButton());

  @override
  Widget? get drawer => const AppDrawer();

  @override
  Widget? get bottomNavigationBar => AppBottomNavigationBar(selectedIndex: controller.pageDetail.bottomBarItemNumber);

  @override
  Widget get body => Obx(() => Column(children: [
    _widgetGeneral(),
    _widgetUpdate(),
    _widgetBackup(),
    _widgetStorage(),
  ]));

  Widget _widgetAppbarThreeDotsButton() => AppPopupMenu(listItems: _listAppbarThreeDotsButton, lightColorIcon: false);

  List<AppPopupMenuItem> get _listAppbarThreeDotsButton => List.of([AppPopupMenuItem(text: Texts.to.settingsAppbarMenuResetSettings, onTapFunction: () => controller.resetAllSettings())]);

  Widget _widgetGeneral() {
    Widget leadingLanguage() => Text(controller.selectedLanguage.value.getLocale.getLanguageName ?? '');

    Widget leadingDarkMode() => AppSwitch(value: controller.darkMode.value, onChanged: (bool value) => controller.functionDarkModeOnChange(value), enabled: false);

    return SettingsSectionWidget(title: Texts.to.settingsSectionTitleGeneral, widgets: [
      SettingsSectionItemWidget(text: Texts.to.settingsSectionTitleGeneralLanguage.withDoubleDots, leading: leadingLanguage(), wholeItemFunction: controller.functionLanguageModal),
      SettingsSectionItemWidget(text: Texts.to.settingsSectionGeneralItemDarkMode, leading: leadingDarkMode()),
    ]);
  }

  Widget _widgetUpdate() => SettingsSectionWidget(title: Texts.to.settingsSectionTitleUpdate, widgets: [
        SettingsSectionItemWidget(text: Texts.to.settingsSectionTitleUpdateCurrentVersion.withDoubleDots, leading: Text(AppInfo.appCurrentVersion.version)),
        SettingsSectionItemWidget(
            text: Texts.to.settingsSectionTitleUpdateAvailableVersion.withDoubleDots,
            leading: Text(controller.updateAvailableVersion.value == AppInfo.appCurrentVersion ? Texts.to.notAvailable : controller.updateAvailableVersion.value),
            wholeItemFunction: controller.functionGoToUpdatePage),
      ]);

  Widget _widgetBackup() => SettingsSectionWidget(title: Texts.to.settingsSectionTitleBackup, widgets: [
        SettingsSectionItemWidget(text: Texts.to.settingsSectionBackupBackup, wholeItemFunction: controller.functionBackup),
        SettingsSectionItemWidget(text: Texts.to.settingsSectionBackupRestore, wholeItemFunction: controller.functionRestore),
      ]);

  Widget _widgetStorage() => SettingsSectionWidget(title: Texts.to.settingsSectionTitleStorage, widgets: [
        SettingsSectionItemWidget(text: Texts.to.settingsSectionStorageItemEraseAllData, wholeItemFunction: controller.clearAllData),
      ]);
}
