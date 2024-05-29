import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_clean_getx_app/core/core_widgets.dart';
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
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(flex: 4, child: shrinkSizedBox),
        Expanded(flex: 4, child: _widgetLogo()),
        Expanded(flex: 8, child: _widgetAppName()),
        Expanded(flex: 6, child: _widgetLoadingIndicator()),
        Expanded(flex: 4, child: _widgetVersion()),
      ]));

  Widget _widgetLogo() => Container(
        alignment: Alignment.center,
        child: Image.asset(controller.logoSource, fit: BoxFit.fitHeight),
      );

  Widget _widgetAppName() => Container(
        alignment: Alignment.center,
        child: Text(controller.appName, style: AppTextStyles.splashScreenAppName),
      );

  Widget _widgetLoadingIndicator() => Container(
        alignment: Alignment.center,
        child: AppProgressIndicator.circular(),
      );

  Widget _widgetVersion() => Container(
        alignment: Alignment.bottomCenter,
        child: Text(controller.appVersion),
      );
}
