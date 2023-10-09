import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'account_view_model.dart';

class Account extends HookConsumerWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final event =
        ref.watch(accountViewModelProvider.select((value) => value.event));
    useEffect(() {
      return event.listen((value) {
        value.when(pickImage: () async {
          final image =
              await ImagePicker().pickImage(source: ImageSource.gallery);
          if (context.mounted) {
            ref.read(accountViewModelProvider).onImagePicked(image);
          }
        }, showError: (e) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(e.toString())));
        });
      }).cancel;
    }, [event]);
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
                onTap: ref.read(accountViewModelProvider).onThumbnailTapped,
                child: Consumer(builder: (context, ref, _) {
                  final value = ref.watch(accountViewModelProvider
                      .select((value) => value.thumbnail));
                  return value == null
                      ? SvgPicture.asset('assets/account_empty.svg')
                      : ClipOval(
                          child: Image.memory(
                            value,
                            fit: BoxFit.cover,
                          ),
                        );
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
