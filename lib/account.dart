import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'account_view_model.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CircleAvatar(radius: 64),
          const SizedBox(height: 32),
          Consumer(builder: (context, ref, _) {
            final name = ref
                .watch(accountViewModelProvider.select((value) => value.name));
            return Text(
              name,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            );
          }),
          const Spacer(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.onErrorContainer,
              backgroundColor: Theme.of(context).colorScheme.errorContainer,
            ),
            child: const Text('Delete account'),
          ),
        ],
      ),
    );
  }
}
