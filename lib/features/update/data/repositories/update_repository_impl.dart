import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/network/network_exception.dart';
import '../remote/data_sources/update_remote_data_source.dart';
import 'update_repository.dart';

class UpdateRepositoryImpl implements UpdateRepository {
  final UpdateRemoteDataSource dataSource;
  const UpdateRepositoryImpl({required this.dataSource});

  @override
  Future<Either<NetworkException, String>> getAvailableVersion() async =>
      dataSource.getAvailableVersion();

  @override
  Future<Either<NetworkException, String>> getUpdateDownloadAddress() =>
      dataSource.getDownloadAddress();

  @override
  Future<Either<NetworkException, File?>> updateDownload({required String savePath}) async =>
      dataSource.updateDownload(savePath: savePath);
}
