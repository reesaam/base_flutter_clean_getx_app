import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_base_clean_getx_app/core/network/dio.dart';

import '../core_functions.dart';
import 'network_exception.dart';

class DioFunctions {
  static Future<Either<NetworkException, T>> get<T>({required String url, request}) async {

    var dio = DioCore.to.dio;

    final T data;
    try {
      final Response result = await dio.get(url);
      if (result.statusCode == 200) {
        appDebugPrint('Data body: ${result.data}');
        appDebugPrint('Status Code: ${result.statusCode}');
        data = result.data;
        return Right(data);
      }
      return Left(NetworkException.handleResponse(result));
    } on DioException catch (ex) {
      appDebugPrint(ex);
      return Left(NetworkException.handleResponse(ex.response));
    } catch (ex) {
      appDebugPrint(ex);
      return Left(NetworkException.parsingDataException());
    }
  }
}
