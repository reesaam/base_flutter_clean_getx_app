import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../core/network/network_exception.dart';

abstract class UpdateRepository {
  Future<Either<NetworkException, String>> getAvailableVersion();
  Future<Either<NetworkException, String>> getUpdateDownloadAddress();
  Future<Either<NetworkException, File?>> updateDownload();
}