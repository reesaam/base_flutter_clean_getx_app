import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/elements/core_use_case.dart';
import '../../data/repositories/versions_repository.dart';
import '../entities/app_version_entity/app_version_entity.dart';

@injectable
class GetVersionsUseCase implements UseCaseNoParams<Exception, AppVersionEntitiesList> {
  final VersionsRepository versionsRepository;

  GetVersionsUseCase({required this.versionsRepository});

  @override
  Future<Either<Exception, AppVersionEntitiesList>> call() async {
    var remoteResponse = await versionsRepository.getRemoteVersions();
    var localResponse = await versionsRepository.getLocalVersions();
    return remoteResponse.isRight() ? remoteResponse : localResponse;
  }
}
