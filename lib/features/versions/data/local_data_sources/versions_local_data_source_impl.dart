import 'package:dartz/dartz.dart';

import '../../../../core/failures/local_exception.dart';
import '../../../../data/storage/app_local_storage.dart';
import '../models/app_version_model/app_version_model.dart';
import 'versions_local_data_source.dart';

class VersionsLocalDataSourceImpl implements VersionsLocalDataSource {
  const VersionsLocalDataSourceImpl();

  @override
  Future<Either<LocalException, AppVersionModelsList>> getVersions() async => AppLocalStorage.to.loadAppVersions();
}
