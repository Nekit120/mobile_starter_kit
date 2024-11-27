import 'dart:developer';
import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:reg_it_abstract/reg_it_abstract.dart';

import '../../../feature/main/presentation/main_page.dart';
import '../../../feature/settings/domain/service/app_settings_bloc.dart';
import '../key_value_storage/key_value_storage.dart';
import '../key_value_storage/storage_key/storage_key.dart';
import '../router/route_names.dart';

class DIContainer implements Registry {
  static final instance = DIContainer._();
  DIContainer._();

  GoRouter _initRouter() => GoRouter(
        initialLocation: "/${RouteNames.main}",
        routes: [
          GoRoute(
            name: RouteNames.main,
            path: "/${RouteNames.main}",
            builder: (context, state) {
              return const MainPage();
            },
          ),
        ],
      );

  Future<void> initDependencies() async {
    put(SingletonRegistrar(_initRouter()));

    final keyValueStorage = SecureStorage();

    final appLocal = await keyValueStorage.get(StorageKey.localState);
    final settingsService = AppSettingsBloc(
        AppSettingsState(locale: appLocal ?? 0),
        secureStorage: keyValueStorage);

    put(SingletonRegistrar(settingsService));
  }

  @override
  void drop<T>() {
    final droppingInstance = GetIt.instance<Registrar<T>>();
    droppingInstance.dispose();
    GetIt.instance.unregister<Registrar<T>>();
  }

  @override
  T get<T>() {
    try {
      return GetIt.instance.get<Registrar<T>>().instance;
    } catch (e, st) {
      log(get.toString(), error: e, stackTrace: st);
      rethrow;
    }
  }

  @override
  void put<T>(Registrar<T> registrar) =>
      GetIt.instance.registerSingleton<Registrar<T>>(registrar);

  bool isExists<T>() => GetIt.instance.isRegistered<Registrar<T>>();
}
