import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          Center(
            child: SizedBox.square(
              dimension: 128,
              child: InkWell(
                borderRadius: BorderRadius.circular(64),
                onTap: () {},
                child: Consumer(builder: (context, ref, _) {
                  final id = ref.watch(accountViewModelProvider
                      .select((value) => value.imageId));
                  return id.isEmpty
                      ? SvgPicture.asset('assets/account_empty.svg')
                      : Image.network(id);
                }),
              ),
            ),
          ),
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
