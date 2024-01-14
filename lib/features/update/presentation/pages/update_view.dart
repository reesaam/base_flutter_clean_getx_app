import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_localization.dart';
import '../../../../core/elements/core_view.dart';
import '../../../../data/info/app_info.dart';
import '../../../../data/resources/app_paddings.dart';
import '../../../../data/resources/app_spaces.dart';
import '../../../../data/resources/app_texts.dart';
import '../../../../app/components/buttons/app_general_button.dart';
import '../../../../app/components/main_components/app_bar.dart';
import '../manager/update_controller.dart';

class UpdatePage extends CoreView<UpdateController> {
  const UpdatePage({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? get appBar =>
      AppAppBar(pageDetail: controller.pageDetail);

  @override
  Widget get body =>
      Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        widgetVersions(),
        AppSpaces.h40,
        widgetButtons(),
      ]);

  Widget widgetVersions() => Obx(() => Card(
          child: Column(children: [
        widgetVersion(Texts.to.updateCurrentVersion, AppInfo.appCurrentVersion),
        AppSpaces.h10,
        widgetVersion(
            Texts.to.updateAvailableVersion,
            controller.availableVersion.value == AppInfo.appCurrentVersion
                ? Texts.to.notAvailable
                : controller.availableVersion.value),
      ])));

  Widget widgetVersion(String title, String version) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(title), Text(version)]);

  Widget widgetButtons() => Obx(() => Padding(
      padding: AppPaddings.updateButtons,
      child: Column(children: [
        AppGeneralButton(
            text: Texts.to.updateCheckUpdate, onTap: controller.checkUpdate),
        AppGeneralButton(
            text: Texts.to.updateDownloadUpdate,
            onTap: controller.downloadUpdate,
            disabled: controller.checkAvailableUpdate()),
      ])));
}
