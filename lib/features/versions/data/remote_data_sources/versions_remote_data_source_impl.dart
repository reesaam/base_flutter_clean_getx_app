import 'package:dartz/dartz.dart';

import '../../../../../core/network/dio_functions.dart';
import '../../../../../data/info/app_apis.dart';
import '../models/app_version_model/app_version_model.dart';
import 'versions_remote_data_source.dart';
import '../../../../core/failures/network_exception.dart';

class VersionsRemoteDataSourceImpl implements VersionsRemoteDataSource {
  const VersionsRemoteDataSourceImpl();

  @override
  Future<Either<NetworkException, AppVersionModelsList>> getVersions() async => await DioFunctions.get<AppVersionModelsList>(url: AppAPIs.apiGetVersions);
}
