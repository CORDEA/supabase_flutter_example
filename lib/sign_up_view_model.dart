import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_view_model.g.dart';

@riverpod
SignUpViewModel signUpViewModel(SignUpViewModelRef ref) {
  return SignUpViewModel();
}

class SignUpViewModel {
  String emailAddress = '';
  String password = '';

  void onEmailAddressChanged(String value) {
    emailAddress = value;
  }

  void onPasswordChanged(String value) {
    password = value;
  }

  void onSubmitTapped() {}
}
