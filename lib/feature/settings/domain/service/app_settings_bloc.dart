import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../core/domain/key_value_storage/key_value_storage.dart';
import '../../../../core/domain/key_value_storage/storage_key/storage_key.dart';
import '../entity/app_locale.dart';

part 'app_settings_event.dart';
part 'app_settings_state.dart';

class AppSettingsBloc extends Bloc<AppSettingsEvent, AppSettingsState> {
  final SecureStorage secureStorage;
  AppSettingsBloc(super.initialState, {required this.secureStorage}) {
    on<ChangeLocalEvent>((event, emit) {
      final appLocal = supportLocaleList.indexOf(event.newLocale);
      secureStorage.put(StorageKey.localState, appLocal);
      emit(AppSettingsState(
        locale: appLocal,
      ));
    });
  }
  AppLocale get currentLocale => supportLocaleList[state.locale];
  final List<AppLocale> supportLocaleList = [
    AppLocale(name: 'Русский', languageCode: 'ru'),
    AppLocale(name: 'English', languageCode: 'en'),
  ];
}
