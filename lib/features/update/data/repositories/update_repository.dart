import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../core/failures/network_exception.dart';

abstract class UpdateRepository {
  Future<Either<Exception, String>> getAvailableVersion();
  Future<Either<Exception, String>> getUpdateDownloadAddress();
  Future<Either<Exception, File?>> updateDownload({required String savePath});
}