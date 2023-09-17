import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'clothes_view_model.dart';

class Clothes extends HookConsumerWidget {
  const Clothes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final event =
        ref.watch(clothesViewModelProvider.select((value) => value.event));
    useEffect(() {
      return event.listen((value) {
        value.when(showError: (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString())),
          );
        });
      }).cancel;
    }, [event]);
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
