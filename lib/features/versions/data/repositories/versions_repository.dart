import 'package:dartz/dartz.dart';

import '../../../../core/network/network_exception.dart';
import '../../domain/entities/app_version_entity/app_version_entity.dart';

abstract class VersionsRepository {
  Future<Either<NetworkException, AppVersionEntitiesList>> getVersions();
}