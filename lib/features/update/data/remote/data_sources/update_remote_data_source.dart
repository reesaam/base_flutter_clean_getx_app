import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/failures/network_exception.dart';

abstract class UpdateRemoteDataSource {
  Future<Either<Exception, String>> getDownloadAddress();
  Future<Either<Exception, String>> getAvailableVersion();
  Future<Either<Exception, File?>> updateDownload({required String savePath});
}