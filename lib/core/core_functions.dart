import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/components/dialogs/app_alert_dialogs.dart';
import '../app/components/general_widgets/app_snack_bars.dart';
import '../data/info/app_info.dart';
import '../data/storage/app_local_storage.dart';
import '../features/update/data/repositories/update_repository.dart';
import 'app_localization.dart';



void appDebugPrint(message) => AppInfo.isRelease ? null : debugPrint('$message');
void appLogPrint(message) => debugPrint('[LOG] ** $message **');

void popPage() {
  Get.back();
}

void saveAppData() => AppLocalStorage.to.saveAllData();

void loadAppData() => AppLocalStorage.to.loadAllData();

void clearAppData() => AppLocalStorage.to.clearStorage();

Future<String> checkAvailableVersion() async {
  var result = await UpdateRepository.to.getAvailableVersion();
  return result.fold((l) => Texts.to.notAvailable, (r) => r);
}

noInternetConnectionSnackBar() => AppSnackBar().showSnackBar(message: Texts.to.connectionInternetNotAvailableText);

void appExitDialog() => AppAlertDialogs().withOkCancel(title: Texts.to.appExit, text: Texts.to.areYouSure, onTapOk: appExit, dismissible: true);

void appExit() {
  appLogPrint('App Exit Triggered');
  AppLocalStorage.to.saveAllData();
  appLogPrint('All App Data Saved');
  exit(0);
}
