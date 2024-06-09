// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';
// import 'package:retrofit/retrofit.dart';
//
// import '../../../../data/info/app_apis.dart';
//
// part 'update_services.g.dart';
//
// @RestApi()
// @injectable
// abstract class UpdateServices {
//   @factoryMethod
//   factory UpdateServices(Dio dio) = _UpdateServices;
//
//   @GET(AppURLs.appUrlUpdateVersion)
//   Future<HttpResponse<String>> getAvailableVersion();
//
//   @GET('download_address')
//   Future<HttpResponse<String>> getDownloadAddress();
//
//   @GET('update_download')
//   Future<HttpResponse<String>> updateDownload();
// }
