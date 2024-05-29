import 'package:injectable/injectable.dart';

@injectable
class LocalException implements Exception {
  final String message;
  LocalException({required this.message});

  static LocalException handleResponse(ex) {
    switch (ex) {
      case null:
        throw NullException();
      // case 203:
      //   throw StorageLoadDataException();
      // case 203:
      //   throw StorageSaveDataException();
      default:
        throw UnknownException();
    }
  }
}

class StorageLoadDataException extends LocalException {
  StorageLoadDataException() : super(message: 'Storage Load Data Exception');
}

class StorageSaveDataException extends LocalException {
  StorageSaveDataException() : super(message: 'Storage Save Data Exception');
}

class NullException extends LocalException {
  NullException() : super(message: 'Null Exception');
}

class UnknownException extends LocalException {
  UnknownException() : super(message: 'Unknown Error');
}
