import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_base_clean_getx_app/core/app_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../resources/app_enums.dart';


part 'app_page_detail.freezed.dart';
part 'app_page_detail.g.dart';

@freezed
class AppPageDetail with _$AppPageDetail {
  const factory AppPageDetail({
    required final AppRoutes pageRoute,
    final String? pageName,
    final int? bottomBarItemNumber,
    final bool? drawerPresence,
    final int? iconCode,
  }) = _AppPageDetail;

  factory AppPageDetail.fromJson(Map<String, dynamic> json) => _$AppPageDetailFromJson(json);
}

@freezed
class AppPageDetailsList with _$AppPageDetailsList {
  factory AppPageDetailsList({@Default(<AppPageDetail>[]) List<AppPageDetail> pageDetailsList}) = _AppPageDetailsList;

  factory AppPageDetailsList.fromJson(Map<String, dynamic> json) => _$AppPageDetailsListFromJson(json);
}
