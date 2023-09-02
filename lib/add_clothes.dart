import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter_example/add_clothes_view_model.dart';

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
