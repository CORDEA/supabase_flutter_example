import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'clothes.dart';
import 'sign_up_view_model.dart';

class SignUp extends HookConsumerWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final event =
        ref.watch(signUpViewModelProvider.select((value) => value.event));
    useEffect(() {
      return event.listen((value) {
        value.when(
          showHome: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Clothes()),
            );
          },
          showError: (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(e.toString())),
            );
          },
        );
      }).cancel;
    }, [event]);
    final loading = ref.watch(
      signUpViewModelProvider.select((value) => value.isLoading),
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Sign in')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              enabled: !loading,
              decoration: const InputDecoration(
                hintText: 'Email address',
              ),
              onChanged:
                  ref.read(signUpViewModelProvider).onEmailAddressChanged,
            ),
            const SizedBox(height: 16),
            TextField(
              enabled: !loading,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
              onChanged: ref.read(signUpViewModelProvider).onPasswordChanged,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed:
            loading ? null : ref.read(signUpViewModelProvider).onSubmitTapped,
        child: loading
            ? const CircularProgressIndicator()
            : const Icon(Icons.check),
      ),
    );
  }
}
