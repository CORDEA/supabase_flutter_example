import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart/rxdart.dart';

part 'home_view_model.freezed.dart';

final homeViewModelProvider = ChangeNotifierProvider.autoDispose((ref) {
  return HomeViewModel();
});

@Freezed(map: FreezedMapOptions.none, equal: false, copyWith: false)
class HomeViewEvent with _$HomeViewEvent {
  const factory HomeViewEvent.showAddClothes() = _ShowAddClothes;
}

class HomeViewModel extends ChangeNotifier {
  final _event = PublishSubject<HomeViewEvent>();
  int _index = 0;

  int get index => _index;

  bool get visibleAdd => _index == 0;

  Stream<HomeViewEvent> get event => _event;

  void onBottomItemChanged(int index) {
    _index = index;
    notifyListeners();
  }

  void onAddTapped() {
    _event.add(const HomeViewEvent.showAddClothes());
  }

  @override
  void dispose() {
    _event.close();
    super.dispose();
  }
}
