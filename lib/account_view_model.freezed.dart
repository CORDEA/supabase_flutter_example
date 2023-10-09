// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountViewEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pickImage,
    required TResult Function(dynamic e) showError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pickImage,
    TResult? Function(dynamic e)? showError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pickImage,
    TResult Function(dynamic e)? showError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$_PickImage with DiagnosticableTreeMixin implements _PickImage {
  const _$_PickImage();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AccountViewEvent.pickImage()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AccountViewEvent.pickImage'));
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pickImage,
    required TResult Function(dynamic e) showError,
  }) {
    return pickImage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pickImage,
    TResult? Function(dynamic e)? showError,
  }) {
    return pickImage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pickImage,
    TResult Function(dynamic e)? showError,
    required TResult orElse(),
  }) {
    if (pickImage != null) {
      return pickImage();
    }
    return orElse();
  }
}

abstract class _PickImage implements AccountViewEvent {
  const factory _PickImage() = _$_PickImage;
}

/// @nodoc

class _$_ShowError with DiagnosticableTreeMixin implements _ShowError {
  const _$_ShowError(this.e);

  @override
  final dynamic e;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AccountViewEvent.showError(e: $e)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AccountViewEvent.showError'))
      ..add(DiagnosticsProperty('e', e));
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pickImage,
    required TResult Function(dynamic e) showError,
  }) {
    return showError(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pickImage,
    TResult? Function(dynamic e)? showError,
  }) {
    return showError?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pickImage,
    TResult Function(dynamic e)? showError,
    required TResult orElse(),
  }) {
    if (showError != null) {
      return showError(e);
    }
    return orElse();
  }
}

abstract class _ShowError implements AccountViewEvent {
  const factory _ShowError(final dynamic e) = _$_ShowError;

  dynamic get e;
}
