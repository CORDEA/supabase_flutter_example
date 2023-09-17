import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter_example/clothes_repository.dart';

part 'home_view_model.freezed.dart';

final homeViewModelProvider = ChangeNotifierProvider.autoDispose((ref) {
  return HomeViewModel(ref.watch(clothesRepositoryProvider));
});

@Freezed(map: FreezedMapOptions.none, equal: false, copyWith: false)
class HomeViewEvent with _$HomeViewEvent {
  const factory HomeViewEvent.showAddClothes() = _ShowAddClothes;

  const factory HomeViewEvent.showError(dynamic e) = _ShowError;
}

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this._repository) {
    _init();
  }

  final ClothesRepository _repository;
  final _event = PublishSubject<HomeViewEvent>();
  final _fetch = PublishSubject<void>();
  List<HomeItemModel> _items = [];

  StreamSubscription? _subscription;

  PublishSubject<HomeViewEvent> get event => _event;

  List<HomeItemModel> get items => _items;

  void _init() async {
    _subscription = _fetch
        .switchMap((_) => _repository.findAll().asStream())
        .map((event) => event
            .map((e) => HomeItemModel(name: e.name))
            .toList(growable: false))
        .listen((event) {
      _items = event;
      notifyListeners();
    }, onError: (e) {
      event.add(HomeViewEvent.showError(e));
    });
    _fetch.add(null);
  }

  void onAddTapped() {
    _event.add(const HomeViewEvent.showAddClothes());
  }

  @override
  void dispose() {
    _fetch.close();
    _subscription?.cancel();
    _event.close();
    super.dispose();
  }
}

class HomeItemModel {
  HomeItemModel({required this.name});

  final String name;
}
