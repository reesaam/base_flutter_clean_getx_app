import 'package:dartz/dartz.dart';

import '../../../../core/failures/local_exception.dart';
import '../../../../features/versions/domain/entities/app_version_entity/app_version_mapper.dart';
import '../../../../core/failures/network_exception.dart';
import '../../domain/entities/app_version_entity/app_version_entity.dart';
import '../local_data_sources/versions_local_data_source.dart';
import '../remote_data_sources/versions_remote_data_source.dart';
import 'versions_repository.dart';

class VersionsRepositoryImpl implements VersionsRepository {
  final VersionsRemoteDataSource remoteDataSource;
  final VersionsLocalDataSource localDataSource;
  const VersionsRepositoryImpl({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<NetworkException, AppVersionEntitiesList>> getRemoteVersions() async => await remoteDataSource.getVersions().then((value) => value.map((r) => r.mapper));

  @override
  Future<Either<LocalException, AppVersionEntitiesList>> getLocalVersions() async => await localDataSource.getVersions().then((value) => value.map((r) => r.mapper));
}
