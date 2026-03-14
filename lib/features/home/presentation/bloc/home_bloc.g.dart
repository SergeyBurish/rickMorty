// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HomeStateCWProxy {
  HomeState status(HomeStatus status);

  HomeState characters(List<Character> characters);

  HomeState nextUrl(String? nextUrl);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `HomeState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// HomeState(...).copyWith(id: 12, name: "My name")
  /// ```
  HomeState call({
    HomeStatus status,
    List<Character> characters,
    String? nextUrl,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfHomeState.copyWith(...)` or call `instanceOfHomeState.copyWith.fieldName(value)` for a single field.
class _$HomeStateCWProxyImpl implements _$HomeStateCWProxy {
  const _$HomeStateCWProxyImpl(this._value);

  final HomeState _value;

  @override
  HomeState status(HomeStatus status) => call(status: status);

  @override
  HomeState characters(List<Character> characters) =>
      call(characters: characters);

  @override
  HomeState nextUrl(String? nextUrl) => call(nextUrl: nextUrl);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `HomeState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// HomeState(...).copyWith(id: 12, name: "My name")
  /// ```
  HomeState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? characters = const $CopyWithPlaceholder(),
    Object? nextUrl = const $CopyWithPlaceholder(),
  }) {
    return HomeState._(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as HomeStatus,
      characters:
          characters == const $CopyWithPlaceholder() || characters == null
          ? _value.characters
          // ignore: cast_nullable_to_non_nullable
          : characters as List<Character>,
      nextUrl: nextUrl == const $CopyWithPlaceholder()
          ? _value.nextUrl
          // ignore: cast_nullable_to_non_nullable
          : nextUrl as String?,
    );
  }
}

extension $HomeStateCopyWith on HomeState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfHomeState.copyWith(...)` or `instanceOfHomeState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HomeStateCWProxy get copyWith => _$HomeStateCWProxyImpl(this);
}
