import 'package:flutter/material.dart';

import '../../../data/data_entities/app_page_detail/app_page_detail.dart';
import '../../../data/resources/app_colors.dart';
import '../../../data/resources/app_paddings.dart';
import '../../../data/resources/app_text_styles.dart';

class AppAppBar extends AppBar {
  AppAppBar({super.key, required this.pageDetail, this.barLeading, this.barAction}) : super();

  final AppPageDetail pageDetail;
  final Widget? barLeading;
  final Widget? barAction;

  @override
  Widget? get title => Text(pageDetail.pageName ?? '', style: AppTextStyles.appBarTitle);

  @override
  Widget? get leading => barLeading;

  @override
  List<Widget>? get actions => [Padding(padding: AppPaddings.appBarActions, child: barAction)];

  @override
  Color? get backgroundColor => AppColors.appBarBackground;

  @override
  bool? get centerTitle => true;
}
