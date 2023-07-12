import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:liquidgalaxybasic/screens/splash_screen.dart';
import 'package:liquidgalaxybasic/services/lg_service.dart';
import 'package:liquidgalaxybasic/services/local_storage_service.dart';
import 'package:liquidgalaxybasic/services/ssh_creds_storage_service.dart';

void setupServices() {
  GetIt.I.registerLazySingleton(() => SSHcredsStorage());
  GetIt.I.registerLazySingleton(() => LocalStorageService());
  GetIt.I.registerLazySingleton(() => LGservice());
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServices();
  GetIt.I<LocalStorageService>().loadStorage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: App(),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
