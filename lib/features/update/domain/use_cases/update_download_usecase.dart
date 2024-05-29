import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/elements/core_use_case.dart';
import '../../../../core/failures/network_exception.dart';
import '../../data/repositories/update_repository.dart';

@injectable
class UpdateDownloadUseCase implements UseCaseWithParams<Exception, File?, String> {
  final UpdateRepository updateRepository;

  UpdateDownloadUseCase({required this.updateRepository});

  @override
  Future<Either<Exception, File?>> call(savePath) async => await updateRepository.updateDownload(savePath: savePath);
}
