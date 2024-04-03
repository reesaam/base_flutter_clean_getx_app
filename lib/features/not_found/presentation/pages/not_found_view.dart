import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/components/main_components/app_bar.dart';
import '../../../../core/app_extensions/data_types_extensions/extension_icon.dart';
import '../../../../core/app_localization.dart';
import '../../../../core/elements/core_view.dart';
import '../manager/not_found_controller.dart';

class NotFoundPage extends CoreView<NotFoundController> {
  const NotFoundPage({super.key});

  @override
  PreferredSizeWidget? get appBar => AppAppBar(pageDetail: controller.pageDetail);

  @override
  Widget get body => Container(
      alignment: Alignment.center,
      width: Get.width,
      height: Get.height - 100,
      child: Stack(children: [
        _widgetMain(),
      ]));

  Widget _widgetMain() => Container(
      alignment: Alignment.center,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        controller.icon.withSize(Get.size.width / 6),
        Text(Texts.to.notFoundPageName),
      ]));
}
