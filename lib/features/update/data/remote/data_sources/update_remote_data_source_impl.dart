import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/core_functions.dart';
import '../../../../../core/network/dio_functions.dart';
import '../../../../../data/info/app_urls.dart';
import 'update_remote_data_source.dart';
import '../../../../../core/network/network_exception.dart';

class UpdateRemoteDataSourceImpl implements UpdateRemoteDataSource {
  const UpdateRemoteDataSourceImpl();

  @override
  Future<Either<NetworkException, String>> getAvailableVersion() async => await DioFunctions.get<String>(url: AppURLs.appUrlUpdateVersion);

  @override
  Future<Either<NetworkException, String>> getDownloadAddress() async => await DioFunctions.get<String>(url: AppURLs.appUrlUpdateAPKDownload);

  @override
  Future<Either<NetworkException, File?>> updateDownload({required String savePath}) async => await DioFunctions.download(url: AppURLs.appUrlUpdateAPKDownload, savePath: savePath);
}
