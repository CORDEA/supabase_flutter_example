import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'clothes.dart';
import 'sign_in_view_model.dart';
import 'sign_up.dart';

class SignIn extends HookConsumerWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final event =
        ref.watch(signInViewModelProvider.select((value) => value.event));
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
    return Scaffold(
      appBar: AppBar(title: const Text('Sign in')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Email address',
              ),
              onChanged:
                  ref.read(signInViewModelProvider).onEmailAddressChanged,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
              onChanged: ref.read(signInViewModelProvider).onPasswordChanged,
            ),
            const SizedBox(height: 32),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SignUp()),
                );
              },
              child: const Text('Sign up'),
            ),
          ],
        ),
      ),
      floatingActionButton: Consumer(builder: (context, ref, _) {
        final loading = ref.watch(
          signInViewModelProvider.select((value) => value.isLoading),
        );
        return FloatingActionButton.large(
          onPressed:
              loading ? null : ref.read(signInViewModelProvider).onSubmitTapped,
          child: loading
              ? const CircularProgressIndicator()
              : const Icon(Icons.navigate_next),
        );
      }),
    );
  }
}
