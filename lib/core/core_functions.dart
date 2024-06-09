import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_clean_getx_app/features/versions/data/repositories/versions_repository_impl.dart';
import 'package:get/get.dart';

import '../app/components/dialogs/app_alert_dialogs.dart';
import '../app/components/general_widgets/app_snack_bars.dart';
import '../data/info/app_info.dart';
import '../data/storage/app_local_storage.dart';
import '../features/versions/data/repositories/versions_repository.dart';
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

Future<AppVersionEntitiesList?> getVersions() async {
  final GetVersionsUseCase getVersionsUseCase = GetVersionsUseCase(versionsRepository: Get.find());
  var response = await getVersionsUseCase.call();
  return response.fold((l) => null, (r) => r);
}

Future<String> checkAvailableVersion() async {
  String version = Texts.to.notAvailable;
  var response = await getVersions();
  if (response != null && response.versionsList.isNotEmpty) {
    version = response.versionsList.last.version;
  }
  return version;
}

Future<AppVersionEntity> getCurrentVersion() async {
  VersionsRepository versionsRepository = VersionsRepositoryImpl(remoteDataSource: Get.find(), localDataSource: Get.find());
  AppVersionEntity version = AppVersionEntity.createEmpty();
  var response = await versionsRepository.getLocalVersions();
  response.fold((l) => null, (r) => version = r.versionsList.last);
  return version;
}

noInternetConnectionSnackBar() => AppSnackBar().showSnackBar(message: Texts.to.connectionInternetNotAvailableText);

void appExitDialog() => AppAlertDialogs().withOkCancel(title: Texts.to.appExit, text: Texts.to.areYouSure, onTapOk: appExit, dismissible: true);

void appExit() {
  appLogPrint('App Exit Triggered');
  AppLocalStorage.to.saveAllDataToStorage();
  appLogPrint('All App Data Saved');
  exit(0);
}
