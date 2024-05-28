import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_extensions/data_types_extensions/extension_int.dart';
import '../../../core/app_localization.dart';
import '../../../core/app_routing/routing.dart';
import '../../../core/core_functions.dart';
import '../../../data/data_entities/app_page_detail/app_page_detail.dart';
import '../../../data/info/app_info.dart';
import '../../../data/info/app_page_details.dart';
import '../../../data/resources/app_icons.dart';
import '../../../data/resources/app_logos.dart';
import '../../../data/resources/app_paddings.dart';
import '../../../data/resources/app_sizes.dart';
import '../../../data/resources/app_spaces.dart';
import '../general_widgets/app_dividers.dart';

class AppDrawer extends Drawer {
  const AppDrawer({super.key});

  @override
  double? get width => Get.width / 1.6;

  @override
  Widget? get child => SafeArea(
          child: Column(children: [
        header(),
        AppDividers.generalDivider,
        Expanded(child: body()),
        AppDividers.generalDivider,
        footer(),
      ]));

  Widget header() => Container(
      padding: AppPaddings.drawerHeader,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [Image.asset(AppLogos.appLogo, width: AppSizes.drawerHeaderIconWidth), Text(Texts.to.app_name)]));

  Widget body() {
    List<AppPageDetail> drawerList = AppPageDetails.listPages.where((element) => element.drawerPresence == true).toList();
    return Column(children: List.generate(drawerList.length, (index) => _bodyItem(drawerList[index])));
  }

  Widget _bodyItem(AppPageDetail page) => ListTile(title: Text(page.pageName ?? ''), leading: page.iconCode.toIcon, onTap: () => {popPage(), goToPage(page.pageRoute)});

  Widget footer() => Container(
      padding: AppPaddings.drawerFooter,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        AppIcons.version,
        AppSpaces.w20,
        InkWell(onTap: () => goToUpdatePage(), child: Text('${Texts.to.version}: ${AppInfo.appCurrentVersion.version}')),
      ]));
}
