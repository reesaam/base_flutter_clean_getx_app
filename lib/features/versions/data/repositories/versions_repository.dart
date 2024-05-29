import 'package:dartz/dartz.dart';

import '../../../../core/failures/local_exception.dart';
import '../../../../core/failures/network_exception.dart';
import '../../domain/entities/app_version_entity/app_version_entity.dart';

abstract class VersionsRepository {
  Future<Either<NetworkException, AppVersionEntitiesList>> getRemoteVersions();
  Future<Either<LocalException, AppVersionEntitiesList>> getLocalVersions();
}