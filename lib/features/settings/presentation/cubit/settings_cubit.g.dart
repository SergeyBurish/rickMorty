// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SettingsStateCWProxy {
  SettingsState status(SettingsStatus status);

  SettingsState themeType(ThemeType themeType);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `SettingsState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SettingsState(...).copyWith(id: 12, name: "My name")
  /// ```
  SettingsState call({SettingsStatus status, ThemeType themeType});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSettingsState.copyWith(...)` or call `instanceOfSettingsState.copyWith.fieldName(value)` for a single field.
class _$SettingsStateCWProxyImpl implements _$SettingsStateCWProxy {
  const _$SettingsStateCWProxyImpl(this._value);

  final SettingsState _value;

  @override
  SettingsState status(SettingsStatus status) => call(status: status);

  @override
  SettingsState themeType(ThemeType themeType) => call(themeType: themeType);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `SettingsState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SettingsState(...).copyWith(id: 12, name: "My name")
  /// ```
  SettingsState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? themeType = const $CopyWithPlaceholder(),
  }) {
    return SettingsState._(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as SettingsStatus,
      themeType: themeType == const $CopyWithPlaceholder() || themeType == null
          ? _value.themeType
          // ignore: cast_nullable_to_non_nullable
          : themeType as ThemeType,
    );
  }
}

extension $SettingsStateCopyWith on SettingsState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSettingsState.copyWith(...)` or `instanceOfSettingsState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SettingsStateCWProxy get copyWith => _$SettingsStateCWProxyImpl(this);
}
