import 'package:get_it/get_it.dart';
import 'package:liquidgalaxybasic/services/local_storage_service.dart';

class SSHcredsStorage {
  LocalStorageService get localstorage => GetIt.I<LocalStorageService>();

  void setvalue(String key, String value) async {
    localstorage.setItem(key, value);
  }

  String getvalue(String key) {
    String? value = localstorage.getItem(key);
    return value ?? '';
  }
}
