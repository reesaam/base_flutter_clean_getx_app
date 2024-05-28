import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../features/versions/domain/entities/app_version_entity/app_version_mapper.dart';
import '../../../../core/network/network_exception.dart';
import '../../domain/entities/app_version_entity/app_version_entity.dart';
import '../remote/data_sources/versions_remote_data_source.dart';
import 'versions_repository.dart';

class VersionsRepositoryImpl implements VersionsRepository {
  final VersionsRemoteDataSource dataSource;
  const VersionsRepositoryImpl({required this.dataSource});

  @override
  Future<Either<NetworkException, AppVersionEntitiesList>> getVersions() async => await dataSource.getVersions().then((value) => value.map((r) => r.mapper));
}
