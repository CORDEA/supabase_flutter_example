import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';

import 'entities/clothes.dart';
import 'repositories/clothes_repository.dart';

part 'add_clothes_view_model.freezed.dart';

final addClothesViewModelProvider = ChangeNotifierProvider.autoDispose((ref) {
  return AddClothesViewModel(ref.watch(clothesRepositoryProvider));
});

@Freezed(map: FreezedMapOptions.none, equal: false, copyWith: false)
class AddClothesViewEvent with _$AddClothesViewEvent {
  const factory AddClothesViewEvent.back() = _Back;

  const factory AddClothesViewEvent.showError(dynamic e) = _ShowError;

  const factory AddClothesViewEvent.pickImage() = _PickImage;
}

class AddClothesViewModel extends ChangeNotifier {
  AddClothesViewModel(this._repository);

  final ClothesRepository _repository;
  final _event = PublishSubject<AddClothesViewEvent>();

  bool get isLoading => _isLoading;

  PublishSubject<AddClothesViewEvent> get event => _event;

  File? get thumbnail => _thumbnail;

  bool _isLoading = false;
  StreamSubscription? _subscription;
  String _name = '';
  String _width = '';
  String _length = '';
  String _sleeveLength = '';
  String _shoulderWidth = '';
  File? _thumbnail;

  void onThumbnailTapped() {
    _event.add(const AddClothesViewEvent.pickImage());
  }

  void onImagePicked(XFile? file) {
    if (file == null) {
      return;
    }
    _thumbnail = File(file.path);
    notifyListeners();
  }

  void onNameChanged(String value) {
    _name = value;
  }

  void onWidthChanged(String value) {
    _width = value;
  }

  void onLengthChanged(String value) {
    _length = value;
  }

  void onSleeveLengthChanged(String value) {
    _sleeveLength = value;
  }

  void onShoulderWidthChanged(String value) {
    _shoulderWidth = value;
  }

  void onSubmitTapped() {
    _isLoading = true;
    notifyListeners();
    final name = _name;
    final width = int.tryParse(_width);
    final length = int.tryParse(_length);
    final sleeveLength = int.tryParse(_sleeveLength);
    final shoulderWidth = int.tryParse(_shoulderWidth);
    if (name.isEmpty ||
        width == null ||
        length == null ||
        sleeveLength == null ||
        shoulderWidth == null) {
      _isLoading = false;
      notifyListeners();
      return;
    }
    _subscription = Stream.value(_thumbnail)
        .flatMap((file) {
          if (file == null) {
            return Stream.value(null);
          }
          return _repository.insertThumbnail(file).asStream();
        })
        .flatMap(
          (value) => _repository
              .insert(Clothes.tops(
                name: name,
                width: width,
                length: length,
                sleeveLength: sleeveLength,
                shoulderWidth: shoulderWidth,
                imageId: value,
              ))
              .asStream(),
        )
        .listen((event) {
          _event.add(const AddClothesViewEvent.back());
        }, onError: (e) {
          _event.add(AddClothesViewEvent.showError(e));
        }, onDone: () {
          _isLoading = false;
          notifyListeners();
        });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
