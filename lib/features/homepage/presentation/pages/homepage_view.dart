import 'package:flutter/material.dart';

import '../../../../data/info/app_developer_info.dart';
import '../../../../data/resources/app_spaces.dart';
import '../../../../core/elements/core_view.dart';
import '../../../../data/info/app_info.dart';
import '../../../../data/resources/app_logos.dart';
import '../../../../data/resources/app_paddings.dart';
import '../../../../data/resources/app_sizes.dart';
import '../../../../app/components/main_components/app_bar.dart';
import '../../../../app/components/main_components/app_bottom_navigation_bar.dart';
import '../../../../app/components/main_components/app_drawer.dart';
import '../manager/homepage_controller.dart';

class HomePage extends CoreView<HomePageController> {
  const HomePage({super.key});

  @override
  PreferredSizeWidget? get appBar =>
      AppAppBar(pageDetail: controller.pageDetail);

  @override
  Widget? get drawer => const AppDrawer();

  @override
  Widget? get topBar => widgetTopBar();

  @override
  Widget? get bottomNavigationBar => AppBottomNavigationBar(
      selectedIndex: controller.pageDetail.bottomBarItemNumber);

  @override
  Widget get body => Column();

  Widget widgetTopBar() => Container(
      alignment: Alignment.center,
      padding: AppPaddings.homepageTopBar,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppLogos.appLogo, width: AppSizes.homepageLogo),
            AppSpaces.h40,
            Text(AppInfo.appName),
            Text('by ${AppDeveloperInfo.fullName}'),
          ]));
}
