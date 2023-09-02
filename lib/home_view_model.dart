import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'supabase.dart';

part 'home_view_model.freezed.dart';

final homeViewModelProvider = ChangeNotifierProvider.autoDispose((ref) {
  return HomeViewModel(ref.watch(supabaseClientProvider));
});

@Freezed(map: FreezedMapOptions.none, equal: false, copyWith: false)
class HomeViewEvent with _$HomeViewEvent {
  const factory HomeViewEvent.showAddClothes() = _ShowAddClothes;
}

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this._client);

  final SupabaseClient _client;

  final _event = PublishSubject<HomeViewEvent>();

  PublishSubject<HomeViewEvent> get event => _event;

  Future<void> _init() async {}

  void onAddTapped() {
    _event.add(const HomeViewEvent.showAddClothes());
  }
}
