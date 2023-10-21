import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'add_clothes_view_model.dart';

class AddClothes extends HookConsumerWidget {
  const AddClothes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final event =
        ref.watch(addClothesViewModelProvider.select((value) => value.event));
    useEffect(() {
      return event.listen((value) {
        value.when(back: () {
          Navigator.pop(context);
        }, showError: (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString())),
          );
        }, pickImage: () async {
          final image =
              await ImagePicker().pickImage(source: ImageSource.gallery);
          if (context.mounted) {
            ref.read(addClothesViewModelProvider).onImagePicked(image);
          }
        });
      }).cancel;
    }, [event]);
    return Scaffold(
      appBar: AppBar(title: const Text('Add clothes')),
      body: _Body(),
      floatingActionButton: Consumer(builder: (context, ref, _) {
        final loading = ref.watch(
            addClothesViewModelProvider.select((value) => value.isLoading));
        return FloatingActionButton.large(
          onPressed: loading
              ? null
              : ref.read(addClothesViewModelProvider).onSubmitTapped,
          child: loading
              ? const CircularProgressIndicator()
              : const Icon(Icons.check),
        );
      }),
    );
  }
}

class _Body extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Consumer(
              builder: (context, ref, child) {
                final file = ref.watch(addClothesViewModelProvider
                    .select((value) => value.thumbnail));
                if (file == null) {
                  return Ink(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: InkWell(
                      onTap: ref
                          .read(addClothesViewModelProvider)
                          .onThumbnailTapped,
                      child: const Center(
                        child: Icon(Icons.photo_library_outlined, size: 32),
                      ),
                    ),
                  );
                }
                return Ink(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(file),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: child,
                );
              },
              child: InkWell(
                onTap: ref.read(addClothesViewModelProvider).onThumbnailTapped,
              ),
            ),
          ),
          const SizedBox(height: 32),
          TextField(
            onChanged: ref.read(addClothesViewModelProvider).onNameChanged,
            decoration: const InputDecoration(hintText: 'Name'),
          ),
          const SizedBox(height: 16),
          TextField(
            onChanged: ref.read(addClothesViewModelProvider).onWidthChanged,
            decoration: const InputDecoration(hintText: 'Width'),
          ),
          const SizedBox(height: 16),
          TextField(
            onChanged: ref.read(addClothesViewModelProvider).onLengthChanged,
            decoration: const InputDecoration(hintText: 'Length'),
          ),
          const SizedBox(height: 16),
          TextField(
            onChanged:
                ref.read(addClothesViewModelProvider).onSleeveLengthChanged,
            decoration: const InputDecoration(hintText: 'Sleeve length'),
          ),
          const SizedBox(height: 16),
          TextField(
            onChanged:
                ref.read(addClothesViewModelProvider).onShoulderWidthChanged,
            decoration: const InputDecoration(hintText: 'Shoulder width'),
          ),
        ],
      ),
    );
  }
}
