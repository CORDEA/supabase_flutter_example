import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'supabase.dart';

part 'sign_in_view_model.freezed.dart';

final signInViewModelProvider =
    ChangeNotifierProvider.autoDispose<SignInViewModel>((ref) {
  return SignInViewModel(ref.watch(supabaseClientProvider));
});

@Freezed(map: FreezedMapOptions.none, equal: false, copyWith: false)
class SignInViewEvent with _$SignInViewEvent {
  const factory SignInViewEvent.showHome() = _ShowHome;

  const factory SignInViewEvent.showError(dynamic e) = _ShowError;
}

class SignInViewModel extends ChangeNotifier {
  SignInViewModel(this._client);

  final SupabaseClient _client;

  String _emailAddress = '';
  String _password = '';
  StreamSubscription? _subscription;

  bool _isLoading = false;
  final _event = PublishSubject<SignInViewEvent>();

  bool get isLoading => _isLoading;

  PublishSubject<SignInViewEvent> get event => _event;

  void onEmailAddressChanged(String value) {
    _emailAddress = value;
  }

  void onPasswordChanged(String value) {
    _password = value;
  }

  void onSubmitTapped() {
    _isLoading = true;
    notifyListeners();
    _subscription = _client.auth
        .signInWithPassword(email: _emailAddress, password: _password)
        .asStream()
        .listen((event) {
      _event.add(const SignInViewEvent.showHome());
    }, onError: (e) {
      _event.add(SignInViewEvent.showError(e));
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
