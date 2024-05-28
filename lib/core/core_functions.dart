import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/components/dialogs/app_alert_dialogs.dart';
import '../app/components/general_widgets/app_snack_bars.dart';
import '../data/info/app_info.dart';
import '../data/storage/app_local_storage.dart';
import '../features/versions/domain/entities/app_version_entity/app_version_entity.dart';
import '../features/versions/domain/use_cases/get_versions_usecase.dart';
import 'app_localization.dart';

void appDebugPrint(message) => AppInfo.isRelease ? null : debugPrint('$message');
void appLogPrint(message) => debugPrint('[LOG] ** $message **');

void popPage() {
  Get.back();
}

void saveAppData() => AppLocalStorage.to.saveAllDataToStorage();

void loadAppData() => AppLocalStorage.to.loadAllDataFromStorage();

void clearAppData() => AppLocalStorage.to.clearStorage();

Future<String> checkAvailableVersion() async {
  final GetVersionsUseCase getVersionsUseCase = GetVersionsUseCase(versionsRepository: Get.find());
  var response = await getVersionsUseCase.call();
  AppVersionEntity? remoteLastVersion = response.fold((l) => null, (r) => r.versionsList.last);
  return AppInfo.appCurrentVersion == remoteLastVersion || remoteLastVersion == null ? Texts.to.notAvailable : remoteLastVersion.version;
}

noInternetConnectionSnackBar() => AppSnackBar().showSnackBar(message: Texts.to.connectionInternetNotAvailableText);

void appExitDialog() => AppAlertDialogs().withOkCancel(title: Texts.to.appExit, text: Texts.to.areYouSure, onTapOk: appExit, dismissible: true);

void appExit() {
  appLogPrint('App Exit Triggered');
  AppLocalStorage.to.saveAllDataToStorage();
  appLogPrint('All App Data Saved');
  exit(0);
}
