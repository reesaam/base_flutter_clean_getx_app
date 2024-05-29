import 'dart:io';

import 'package:dartz/dartz.dart';

import '../remote/data_sources/update_remote_data_source.dart';
import 'update_repository.dart';

class UpdateRepositoryImpl implements UpdateRepository {
  final UpdateRemoteDataSource dataSource;
  const UpdateRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Exception, String>> getAvailableVersion() async => await dataSource.getAvailableVersion();

  @override
  Future<Either<Exception, String>> getUpdateDownloadAddress() async => await dataSource.getDownloadAddress();

  @override
  Future<Either<Exception, File?>> updateDownload({required String savePath}) async => dataSource.updateDownload(savePath: savePath);
}
