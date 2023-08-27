import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'supabase.dart';

part 'sign_up_view_model.freezed.dart';

final signUpViewModelProvider =
    ChangeNotifierProvider.autoDispose<SignUpViewModel>((ref) {
  return SignUpViewModel(ref.watch(supabaseClientProvider));
});

@Freezed(map: FreezedMapOptions.none, equal: false, copyWith: false)
class SignUpViewEvent with _$SignUpViewEvent {
  const factory SignUpViewEvent.showHome() = _ShowHome;

  const factory SignUpViewEvent.showError(dynamic e) = _ShowError;
}

class SignUpViewModel extends ChangeNotifier {
  SignUpViewModel(this._client);

  final SupabaseClient _client;

  String _emailAddress = '';
  String _password = '';
  StreamSubscription? _subscription;

  bool _isLoading = false;
  final _event = PublishSubject<SignUpViewEvent>();

  bool get isLoading => _isLoading;

  PublishSubject<SignUpViewEvent> get event => _event;

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
        .signUp(email: _emailAddress, password: _password)
        .asStream()
        .listen((event) {
      _event.add(const SignUpViewEvent.showHome());
    }, onError: (e) {
      _event.add(SignUpViewEvent.showError(e));
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
