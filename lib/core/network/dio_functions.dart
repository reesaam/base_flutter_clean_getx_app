import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../core_functions.dart';
import 'dio.dart';
import '../failures/network_exception.dart';

class DioFunctions {
  static Future<Either<NetworkException, T>> get<T>({required String url, request}) async {
    var dio = DioCore().dio;
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

  static Future<Either<NetworkException, T>> post<T>({required String url, request}) async {
    var dio = DioCore().dio;
    final T data;
    try {
      final Response result = await dio.post(url);
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

  static Future<Either<NetworkException, T>> put<T>({required String url, request}) async {
    var dio = DioCore().dio;
    final T data;
    try {
      final Response result = await dio.put(url);
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

  static Future<Either<NetworkException, File>> download({required String url, required String savePath, request}) async {
    var dio = DioCore().dio;
    final File data;
    try {
      final savePath = _getSavePath();
      final Response result = await dio.download(url, savePath);
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

  ///TODO: Implementation
  static Future<String> _getSavePath() async => '';
}
