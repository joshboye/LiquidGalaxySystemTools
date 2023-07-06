import 'package:get_it/get_it.dart';
import 'package:liquidgalaxybasic/services/local_storage_service.dart';

class SSHcredsStorage {
  LocalStorageService get _localStorageService => GetIt.I<LocalStorageService>();

  Future<void> setSetting(String key, dynamic value) async {
    switch (key) {
      case 'username':
        await _localStorageService.setItem(key, value);
        break;
      case 'password':
        await _localStorageService.setItem(key, value);
        break;
      case 'ip':
        await _localStorageService.setItem(key, value);
        break;
      case 'port':
        await _localStorageService.setItem(key, value);
        break;
    }
  }

  dynamic getSetting(String key) {
    switch (key) {
      case 'username':
        return _localStorageService.getItem(key);
      case 'password':
        return _localStorageService.getItem(key);
      case 'ip':
        return _localStorageService.getItem(key);
      case 'port':
        return _localStorageService.getItem(key);
    }
  }
}
