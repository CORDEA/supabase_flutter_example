// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignInViewEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() showHome,
    required TResult Function(dynamic e) showError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? showHome,
    TResult? Function(dynamic e)? showError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? showHome,
    TResult Function(dynamic e)? showError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$_ShowHome implements _ShowHome {
  const _$_ShowHome();

  @override
  String toString() {
    return 'SignInViewEvent.showHome()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() showHome,
    required TResult Function(dynamic e) showError,
  }) {
    return showHome();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? showHome,
    TResult? Function(dynamic e)? showError,
  }) {
    return showHome?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? showHome,
    TResult Function(dynamic e)? showError,
    required TResult orElse(),
  }) {
    if (showHome != null) {
      return showHome();
    }
    return orElse();
  }
}

abstract class _ShowHome implements SignInViewEvent {
  const factory _ShowHome() = _$_ShowHome;
}

/// @nodoc

class _$_ShowError implements _ShowError {
  const _$_ShowError(this.e);

  @override
  final dynamic e;

  @override
  String toString() {
    return 'SignInViewEvent.showError(e: $e)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() showHome,
    required TResult Function(dynamic e) showError,
  }) {
    return showError(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? showHome,
    TResult? Function(dynamic e)? showError,
  }) {
    return showError?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? showHome,
    TResult Function(dynamic e)? showError,
    required TResult orElse(),
  }) {
    if (showError != null) {
      return showError(e);
    }
    return orElse();
  }
}

abstract class _ShowError implements SignInViewEvent {
  const factory _ShowError(final dynamic e) = _$_ShowError;

  dynamic get e;
}
