import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../features/update/data/remote/data_sources/update_remote_data_source.dart';
import '../../../../features/update/data/remote/data_sources/update_remote_data_source_impl.dart';
import '../../../../features/update/data/repositories/update_repository_impl.dart';
import '../../features/update/data/repositories/update_repository.dart';
import '../../features/versions/data/local_data_sources/versions_local_data_source.dart';
import '../../features/versions/data/local_data_sources/versions_local_data_source_impl.dart';
import '../../features/versions/data/remote_data_sources/versions_remote_data_source.dart';
import '../../features/versions/data/remote_data_sources/versions_remote_data_source_impl.dart';
import '../../features/versions/data/repositories/versions_repository.dart';
import '../../features/versions/data/repositories/versions_repository_impl.dart';

class AppRepositoriesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Dio>(() => Dio(), fenix: true);
    Get.lazyPut<UpdateRepository>(() => UpdateRepositoryImpl(dataSource: Get.find()), fenix: true);
    Get.lazyPut<UpdateRemoteDataSource>(() => const UpdateRemoteDataSourceImpl(), fenix: true);
    Get.lazyPut<VersionsRepository>(() => VersionsRepositoryImpl(localDataSource: Get.find(), remoteDataSource: Get.find()), fenix: true);
    Get.lazyPut<VersionsLocalDataSource>(() => const VersionsLocalDataSourceImpl(), fenix: true);
    Get.lazyPut<VersionsRemoteDataSource>(() => const VersionsRemoteDataSourceImpl(), fenix: true);
  }
}
