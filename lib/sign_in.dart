import 'package:flutter/material.dart';

import 'sign_up.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
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
              onChanged: (text) {},
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
              onChanged: (text) {},
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
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {},
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
