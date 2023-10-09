import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';

import 'repositories/user_repository.dart';

part 'account_view_model.freezed.dart';

final accountViewModelProvider = ChangeNotifierProvider.autoDispose((ref) {
  return AccountViewModel(ref.watch(userRepositoryProvider));
});

@Freezed(map: FreezedMapOptions.none, equal: false, copyWith: false)
class AccountViewEvent with _$AccountViewEvent {
  const factory AccountViewEvent.pickImage() = _PickImage;

  const factory AccountViewEvent.showError(dynamic e) = _ShowError;

  const factory AccountViewEvent.back() = _Back;
}

class AccountViewModel extends ChangeNotifier {
  AccountViewModel(this._repository) {
    _init();
  }

  final UserRepository _repository;
  final _subscriptions = CompositeSubscription();
  final _event = PublishSubject<AccountViewEvent>();
  String _name = '';
  Uint8List? _thumbnail;
  bool _uploading = false;

  String get name => _name;

  Uint8List? get thumbnail => _thumbnail;

  bool get uploading => _uploading;

  Stream<AccountViewEvent> get event => _event;

  Future<void> _init() async {
    Rx.zip2(
      _repository.find().asStream(),
      _repository.findThumbnail().asStream(),
      (a, b) {
        _name = a.name;
        _thumbnail = b;
        notifyListeners();
      },
    ).listen((_) {}).addTo(_subscriptions);
  }

  void onThumbnailTapped() {
    _event.add(const AccountViewEvent.pickImage());
  }

  void onImagePicked(XFile? file) {
    if (file == null) {
      return;
    }
    _uploading = true;
    notifyListeners();
    _repository
        .insertThumbnail(File(file.path))
        .asStream()
        .flatMap((_) => _repository.findThumbnail().asStream())
        .listen((event) {
      _thumbnail = event;
      notifyListeners();
    }, onError: (e) {
      _event.add(AccountViewEvent.showError(e));
    }, onDone: () {
      _uploading = false;
      notifyListeners();
    }).addTo(_subscriptions);
  }

  void onDeleteAccountTapped() {
    _repository.delete().asStream().listen((event) {
      if ((event.status ?? 500) >= 400) {
        _event.add(AccountViewEvent.showError(event.data));
      } else {
        _event.add(const AccountViewEvent.back());
      }
    }, onError: (e) {
      _event.add(AccountViewEvent.showError(e));
    }).addTo(_subscriptions);
  }

  @override
  void dispose() {
    _event.close();
    _subscriptions.cancel();
    super.dispose();
  }
}
