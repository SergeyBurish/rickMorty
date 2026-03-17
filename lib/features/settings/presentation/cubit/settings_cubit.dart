import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_config.dart';
import '../../domain/entity/serrings_entity.dart';
import '../../domain/usecase/settings_usecase.dart';

part 'settings_cubit.g.dart';
part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsUsecase settingsUsecase;
  SettingsCubit({required this.settingsUsecase}) : 
      super(SettingsState.initial()){
    _onLoad();
  }

  void _onLoad () async {
    emit(state.copyWith.status(SettingsStatus.inProgress));
    final output = await settingsUsecase.getSettings();

    output.fold(
      ifLeft: (_) => emit(state.copyWith.status(SettingsStatus.error)),
      ifRight: (SettingsEntity settingsEntity) {
        emit(state.copyWith(
          status: SettingsStatus.success,
          themeMode: settingsEntity.themeMode,
          appLocale: settingsEntity.locale,
        ));
      }
    );
  }

  void onLanguageChanged (AppLocale appLocale) async {
    emit(state.copyWith.status(SettingsStatus.inProgress));
    final output = await settingsUsecase.setSettings(SettingsEntity(
      locale: appLocale,
      themeMode: state.themeMode,
    ));

    output.fold(
      ifLeft: (_) => emit(state.copyWith.status(SettingsStatus.error)),
      ifRight: (_) {
        emit(state.copyWith(
          status: SettingsStatus.success,
          appLocale: appLocale,
        ));
      }
    );
  }

  void onThemeChanged (ThemeMode? themeMode) async {
    if (themeMode == null) {
      return;
    }

    emit(state.copyWith.status(SettingsStatus.inProgress));
    final output = await settingsUsecase.setSettings(SettingsEntity(
      locale: state.appLocale,
      themeMode: themeMode,
    ));

    output.fold(
      ifLeft: (_) => emit(state.copyWith.status(SettingsStatus.error)),
      ifRight: (_) {
        emit(state.copyWith(
          status: SettingsStatus.success,
          themeMode: themeMode,
        ));
      }
    );
  }
}
