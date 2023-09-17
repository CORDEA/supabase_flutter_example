import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter_example/repositories/clothes_repository.dart';

part 'clothes_view_model.freezed.dart';

final clothesViewModelProvider = ChangeNotifierProvider.autoDispose((ref) {
  return ClothesViewModel(ref.watch(clothesRepositoryProvider));
});

@Freezed(map: FreezedMapOptions.none, equal: false, copyWith: false)
class ClothesViewEvent with _$ClothesViewEvent {
  const factory ClothesViewEvent.showAddClothes() = _ShowAddClothes;

  const factory ClothesViewEvent.showError(dynamic e) = _ShowError;
}

class ClothesViewModel extends ChangeNotifier {
  ClothesViewModel(this._repository) {
    _init();
  }

  final ClothesRepository _repository;
  final _event = PublishSubject<ClothesViewEvent>();
  final _fetch = PublishSubject<void>();
  List<ClothesItemModel> _items = [];

  StreamSubscription? _subscription;

  PublishSubject<ClothesViewEvent> get event => _event;

  List<ClothesItemModel> get items => _items;

  void _init() async {
    _subscription = _fetch
        .switchMap((_) => _repository.findAll().asStream())
        .map((event) => event
            .map((e) => ClothesItemModel(name: e.name))
            .toList(growable: false))
        .listen((event) {
      _items = event;
      notifyListeners();
    }, onError: (e) {
      event.add(ClothesViewEvent.showError(e));
    });
    _fetch.add(null);
  }

  void onAddTapped() {
    _event.add(const ClothesViewEvent.showAddClothes());
  }

  @override
  void dispose() {
    _fetch.close();
    _subscription?.cancel();
    _event.close();
    super.dispose();
  }
}

class ClothesItemModel {
  ClothesItemModel({required this.name});

  final String name;
}
