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
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get width => throw _privateConstructorUsedError;
  int get length => throw _privateConstructorUsedError;
  int get sleeveLength => throw _privateConstructorUsedError;
  int get shoulderWidth => throw _privateConstructorUsedError;
  String? get imageId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, String name, int width, int length,
            int sleeveLength, int shoulderWidth, String? imageId)
        tops,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, String name, int width, int length,
            int sleeveLength, int shoulderWidth, String? imageId)?
        tops,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, String name, int width, int length,
            int sleeveLength, int shoulderWidth, String? imageId)?
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
      {this.id = 0,
      required this.name,
      required this.width,
      required this.length,
      required this.sleeveLength,
      required this.shoulderWidth,
      required this.imageId})
      : super._();

  @override
  @JsonKey()
  final int id;
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
  final String? imageId;

  @override
  String toString() {
    return 'Clothes.tops(id: $id, name: $name, width: $width, length: $length, sleeveLength: $sleeveLength, shoulderWidth: $shoulderWidth, imageId: $imageId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Tops &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.length, length) || other.length == length) &&
            (identical(other.sleeveLength, sleeveLength) ||
                other.sleeveLength == sleeveLength) &&
            (identical(other.shoulderWidth, shoulderWidth) ||
                other.shoulderWidth == shoulderWidth) &&
            (identical(other.imageId, imageId) || other.imageId == imageId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, width, length,
      sleeveLength, shoulderWidth, imageId);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, String name, int width, int length,
            int sleeveLength, int shoulderWidth, String? imageId)
        tops,
  }) {
    return tops(id, name, width, length, sleeveLength, shoulderWidth, imageId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, String name, int width, int length,
            int sleeveLength, int shoulderWidth, String? imageId)?
        tops,
  }) {
    return tops?.call(
        id, name, width, length, sleeveLength, shoulderWidth, imageId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, String name, int width, int length,
            int sleeveLength, int shoulderWidth, String? imageId)?
        tops,
    required TResult orElse(),
  }) {
    if (tops != null) {
      return tops(
          id, name, width, length, sleeveLength, shoulderWidth, imageId);
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
      {final int id,
      required final String name,
      required final int width,
      required final int length,
      required final int sleeveLength,
      required final int shoulderWidth,
      required final String? imageId}) = _$_Tops;
  const _Tops._() : super._();

  @override
  int get id;
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
  @override
  String? get imageId;
}
