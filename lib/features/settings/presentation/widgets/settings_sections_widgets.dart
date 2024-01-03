import 'package:flutter/material.dart';

import '../../../../core/core_widgets.dart';
import '../../../../data/resources/app_paddings.dart';
import '../../../../data/resources/app_text_styles.dart';
import '../../../../app/components/general_widgets/app_dividers.dart';

class SettingsSectionsWidgets extends StatelessWidget {
  final String title;
  final List<Widget> widgets;
  const SettingsSectionsWidgets(
      {super.key, required this.title, required this.widgets});

  Widget _title(String text) =>
      Text(text, style: AppTextStyles.settingsSectionTitle);

  @override
  Widget build(BuildContext context) => Padding(
      padding: AppPaddings.settingsSection,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        _title(title),
        AppDividers.settingsDivider,
        Column(children: widgets),
      ]));
}