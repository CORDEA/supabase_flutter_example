import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'repositories/user_repository.dart';

final accountViewModelProvider = ChangeNotifierProvider.autoDispose((ref) {
  return AccountViewModel(ref.watch(userRepositoryProvider));
});

class AccountViewModel extends ChangeNotifier {
  AccountViewModel(this._repository) {
    _init();
  }

  final UserRepository _repository;
  StreamSubscription? _subscription;
  String _name = '';
  String _imageId = '';

  String get name => _name;

  String get imageId => _imageId;

  Future<void> _init() async {
    _subscription = _repository.find().asStream().listen((event) {
      _name = event.name;
      _imageId = event.imageId ?? '';
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
