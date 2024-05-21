import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/network/network_exception.dart';

abstract class UpdateRemoteDataSource {
  Future<Either<NetworkException, String>> getDownloadAddress();
  Future<Either<NetworkException, String>> getAvailableVersion();
  Future<Either<NetworkException, File?>> updateDownload({required String savePath});
}