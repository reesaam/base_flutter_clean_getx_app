import 'package:dartz/dartz.dart';

import '../../../../core/failures/local_exception.dart';
import '../models/app_version_model/app_version_model.dart';

abstract class VersionsLocalDataSource {
  Future<Either<LocalException, AppVersionModelsList>> getVersions();
}