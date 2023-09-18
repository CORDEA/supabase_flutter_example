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

  String get name => _name;

  Future<void> _init() async {
    _subscription = _repository.find().asStream().listen((event) {
      _name = event.name;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
