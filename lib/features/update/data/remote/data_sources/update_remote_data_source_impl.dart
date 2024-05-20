import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/core_functions.dart';
import '../../../../../core/network/dio_functions.dart';
import '../../../../../data/info/app_urls.dart';
import 'update_remote_data_source.dart';
import '../../../../../core/network/network_exception.dart';

@Injectable(as: UpdateRemoteDataSource)
class UpdateRemoteDataSourceImpl implements UpdateRemoteDataSource {
  const UpdateRemoteDataSourceImpl();

  @override
  Future<Either<NetworkException, String>> getAvailableVersion() async {
    return await DioFunctions.get<String>(url: AppURLs.appUrlUpdateVersion);
  }

  @override
  Future<Either<NetworkException, String>> getDownloadAddress() async{
    return await DioFunctions.get<String>(url: AppURLs.appUrlUpdateAPKDownload);
  }

  @override
  Future<Either<NetworkException, File?>> updateDownload() async {
    final Response response;
    File? file;

    try {
      response = await Dio().get(AppURLs.appUrlUpdateAPKDownload);
      if (response.statusCode == 200) {
        appLogPrint('Downloading App...');
        appDebugPrint('Data body: ${response.data}');
        appDebugPrint('Status Code: ${response.statusCode}');
        await file!.writeAsBytes(response.data);
        return Right(file);
      }
      return Left(NetworkException.handleResponse(response));
    } on DioException catch (ex) {
      appDebugPrint(ex);
      return Left(NetworkException.handleResponse(ex.response));
    } catch (ex) {
      appDebugPrint(ex);
      return Left(NetworkException.parsingDataException());
    }
  }
}
