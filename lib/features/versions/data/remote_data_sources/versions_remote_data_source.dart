import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/failures/network_exception.dart';
import '../models/app_version_model/app_version_model.dart';

abstract class VersionsRemoteDataSource {
  Future<Either<NetworkException, AppVersionModelsList>> getVersions();
}