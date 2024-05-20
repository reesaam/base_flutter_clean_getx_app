import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../data/info/app_urls.dart';
import '../../data/resources/app_texts.dart';

@injectable
class DioCore {

  static DioCore get to => Get.find(tag: 'DioCore');

  int get _defaultTimeOut => 15;

  Dio get dio => _getDio();

  _getDio() {
    var dio = Dio(BaseOptions(baseUrl: AppURLs.apiBaseUrl));
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
