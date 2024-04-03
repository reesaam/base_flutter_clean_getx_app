import 'package:flutter/material.dart';

import '../../../../core/elements/core_controller.dart';
import '../../../../data/info/app_page_details.dart';
import '../../../../data/resources/app_icons.dart';

class NotFoundController extends CoreController {

  late Icon icon;

  @override
  void pageInit() {
    pageDetail = AppPageDetails.notFound;
    icon = AppIcons.notFound;
  }
}
