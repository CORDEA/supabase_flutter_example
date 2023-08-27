import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'sign_up_view_model.dart';

class SignUp extends ConsumerWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign in')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Email address',
              ),
              onChanged:
                  ref.read(signUpViewModelProvider).onEmailAddressChanged,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
              onChanged: ref.read(signUpViewModelProvider).onPasswordChanged,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: ref.read(signUpViewModelProvider).onSubmitTapped,
        child: const Icon(Icons.check),
      ),
    );
  }
}
