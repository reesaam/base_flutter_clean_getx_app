import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../data/info/app_apis.dart';
import '../../data/resources/app_texts.dart';

class DioCore {

  static DioCore get to => Get.find();

  int get _defaultTimeOut => 15;

  Dio get dio => _getDio();

  _getDio() {
    var dio = Dio(BaseOptions());
    dio.options.headers.addAll( {
      AppTexts.dioHeaderContentType: AppTexts.dioHeaderContentTypeData,
      AppTexts.dioHeaderConnection: AppTexts.dioHeaderConnectionData,
    });
    dio.options.connectTimeout = Duration(seconds: _defaultTimeOut);
    dio.options.receiveTimeout = Duration(seconds: _defaultTimeOut);
    dio.options.sendTimeout = Duration(seconds: _defaultTimeOut);
    return dio;
  }
}
