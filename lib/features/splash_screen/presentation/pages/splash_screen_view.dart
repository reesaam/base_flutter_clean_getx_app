import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/components/general_widgets/app_progress_indicator.dart';
import '../../../../core/elements/core_view.dart';
import '../../../../data/resources/app_paddings.dart';
import '../../../../data/resources/app_text_styles.dart';
import '../manager/splash_screen_controller.dart';

class SplashScreenPage extends CoreView<SplashScreenController> {
  const SplashScreenPage({super.key});

  @override
  Widget get body => Container(
      alignment: Alignment.center,
      width: Get.width,
      height: Get.height - 100,
      child: Stack(children: [
        _widgetLogo(),
        _widgetAppName(),
        _widgetLoadingIndicator(),
        _widgetVersion(),
      ]));

  Widget _widgetLogo() => Container(
        alignment: Alignment.topCenter,
        child: Image.asset(controller.logoSource),
      );

  Widget _widgetAppName() => Container(
        alignment: Alignment.center,
        child: Text(controller.appName, style: AppTextStyles.splashScreenAppName),
      );

  Widget _widgetLoadingIndicator() => Container(
        alignment: Alignment.center,
        padding: AppPaddings.splashScreenProgressIndicator,
        child: AppProgressIndicator.circular(),
      );

  Widget _widgetVersion() => Container(
        alignment: Alignment.bottomCenter,
        child: Text(controller.appVersion),
      );
}
