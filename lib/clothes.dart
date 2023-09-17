import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter_example/add_clothes.dart';
import 'package:supabase_flutter_example/clothes_view_model.dart';

class Clothes extends HookConsumerWidget {
  const Clothes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final event =
        ref.watch(clothesViewModelProvider.select((value) => value.event));
    useEffect(() {
      return event.listen((value) {
        value.when(
          showAddClothes: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AddClothes()),
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
      appBar: AppBar(title: const Text('Home')),
      body: _Body(),
      floatingActionButton: FloatingActionButton.large(
        onPressed: ref.read(clothesViewModelProvider).onAddTapped,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items =
        ref.watch(clothesViewModelProvider.select((value) => value.items));
    return ListView(
      padding: const EdgeInsets.all(16),
      children: items.map((e) => _Tile(e)).toList(),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile(this.model);

  final ClothesItemModel model;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(model.name),
    );
  }
}
