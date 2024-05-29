import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/elements/core_use_case.dart';
import '../../../../core/failures/network_exception.dart';
import '../../data/repositories/update_repository.dart';

@injectable
class UpdateVersionUseCase implements UseCaseNoParams<Exception, String> {
  final UpdateRepository updateRepository;

  UpdateVersionUseCase({required this.updateRepository});

  @override
  Future<Either<Exception, String>> call() async => await updateRepository.getAvailableVersion();
}
