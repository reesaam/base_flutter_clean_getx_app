import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/elements/core_use_case.dart';
import '../../../../core/network/network_exception.dart';
import '../../data/repositories/versions_repository.dart';
import '../entities/app_version_entity/app_version_entity.dart';

@injectable
class GetVersionsUseCase implements UseCaseNoParams<NetworkException, AppVersionEntitiesList> {
  final VersionsRepository versionsRepository;

  GetVersionsUseCase({required this.versionsRepository});

  @override
  Future<Either<NetworkException, AppVersionEntitiesList>> call() async => await versionsRepository.getVersions();
}
