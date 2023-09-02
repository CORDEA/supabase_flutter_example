// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clothes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Clothes {
  String get name => throw _privateConstructorUsedError;
  int get width => throw _privateConstructorUsedError;
  int get length => throw _privateConstructorUsedError;
  int get sleeveLength => throw _privateConstructorUsedError;
  int get shoulderWidth => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, int width, int length,
            int sleeveLength, int shoulderWidth)
        tops,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, int width, int length, int sleeveLength,
            int shoulderWidth)?
        tops,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, int width, int length, int sleeveLength,
            int shoulderWidth)?
        tops,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Tops value) tops,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Tops value)? tops,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Tops value)? tops,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$_Tops extends _Tops {
  const _$_Tops(
      {required this.name,
      required this.width,
      required this.length,
      required this.sleeveLength,
      required this.shoulderWidth})
      : super._();

  @override
  final String name;
  @override
  final int width;
  @override
  final int length;
  @override
  final int sleeveLength;
  @override
  final int shoulderWidth;

  @override
  String toString() {
    return 'Clothes.tops(name: $name, width: $width, length: $length, sleeveLength: $sleeveLength, shoulderWidth: $shoulderWidth)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Tops &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.length, length) || other.length == length) &&
            (identical(other.sleeveLength, sleeveLength) ||
                other.sleeveLength == sleeveLength) &&
            (identical(other.shoulderWidth, shoulderWidth) ||
                other.shoulderWidth == shoulderWidth));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, width, length, sleeveLength, shoulderWidth);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, int width, int length,
            int sleeveLength, int shoulderWidth)
        tops,
  }) {
    return tops(name, width, length, sleeveLength, shoulderWidth);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, int width, int length, int sleeveLength,
            int shoulderWidth)?
        tops,
  }) {
    return tops?.call(name, width, length, sleeveLength, shoulderWidth);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, int width, int length, int sleeveLength,
            int shoulderWidth)?
        tops,
    required TResult orElse(),
  }) {
    if (tops != null) {
      return tops(name, width, length, sleeveLength, shoulderWidth);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Tops value) tops,
  }) {
    return tops(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Tops value)? tops,
  }) {
    return tops?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Tops value)? tops,
    required TResult orElse(),
  }) {
    if (tops != null) {
      return tops(this);
    }
    return orElse();
  }
}

abstract class _Tops extends Clothes {
  const factory _Tops(
      {required final String name,
      required final int width,
      required final int length,
      required final int sleeveLength,
      required final int shoulderWidth}) = _$_Tops;
  const _Tops._() : super._();

  @override
  String get name;
  @override
  int get width;
  @override
  int get length;
  @override
  int get sleeveLength;
  @override
  int get shoulderWidth;
}
