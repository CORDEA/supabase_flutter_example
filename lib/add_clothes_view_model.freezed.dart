// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_clothes_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddClothesViewEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() back,
    required TResult Function(dynamic e) showError,
    required TResult Function() pickImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? back,
    TResult? Function(dynamic e)? showError,
    TResult? Function()? pickImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? back,
    TResult Function(dynamic e)? showError,
    TResult Function()? pickImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$_Back implements _Back {
  const _$_Back();

  @override
  String toString() {
    return 'AddClothesViewEvent.back()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() back,
    required TResult Function(dynamic e) showError,
    required TResult Function() pickImage,
  }) {
    return back();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? back,
    TResult? Function(dynamic e)? showError,
    TResult? Function()? pickImage,
  }) {
    return back?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? back,
    TResult Function(dynamic e)? showError,
    TResult Function()? pickImage,
    required TResult orElse(),
  }) {
    if (back != null) {
      return back();
    }
    return orElse();
  }
}

abstract class _Back implements AddClothesViewEvent {
  const factory _Back() = _$_Back;
}

/// @nodoc

class _$_ShowError implements _ShowError {
  const _$_ShowError(this.e);

  @override
  final dynamic e;

  @override
  String toString() {
    return 'AddClothesViewEvent.showError(e: $e)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() back,
    required TResult Function(dynamic e) showError,
    required TResult Function() pickImage,
  }) {
    return showError(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? back,
    TResult? Function(dynamic e)? showError,
    TResult? Function()? pickImage,
  }) {
    return showError?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? back,
    TResult Function(dynamic e)? showError,
    TResult Function()? pickImage,
    required TResult orElse(),
  }) {
    if (showError != null) {
      return showError(e);
    }
    return orElse();
  }
}

abstract class _ShowError implements AddClothesViewEvent {
  const factory _ShowError(final dynamic e) = _$_ShowError;

  dynamic get e;
}

/// @nodoc

class _$_PickImage implements _PickImage {
  const _$_PickImage();

  @override
  String toString() {
    return 'AddClothesViewEvent.pickImage()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() back,
    required TResult Function(dynamic e) showError,
    required TResult Function() pickImage,
  }) {
    return pickImage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? back,
    TResult? Function(dynamic e)? showError,
    TResult? Function()? pickImage,
  }) {
    return pickImage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? back,
    TResult Function(dynamic e)? showError,
    TResult Function()? pickImage,
    required TResult orElse(),
  }) {
    if (pickImage != null) {
      return pickImage();
    }
    return orElse();
  }
}

abstract class _PickImage implements AddClothesViewEvent {
  const factory _PickImage() = _$_PickImage;
}
