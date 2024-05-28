import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/data_entities/app_page_detail/app_page_detail.dart';
import '../core_functions.dart';

abstract class CoreController extends GetxController {
  BuildContext context = Get.context!;
  late AppPageDetail pageDetail;

  ///Mandatory Functions
  void dataInit() {}
  void pageInit() {}
  void onInitFunction() {}
  void onReadyFunction() {}
  void onCloseFunction() {}

  @override
  void onInit() {
    dataInit();
    pageInit();
    onInitFunction();
    super.onInit();
  }

  @override
  void onReady() {
    onReadyFunction();
    super.onReady();
  }

  @override
  void onClose() {
    onCloseFunction();
    saveAppData();
    super.onClose();
  }
}
