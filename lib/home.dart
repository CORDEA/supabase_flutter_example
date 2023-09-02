import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter_example/add_clothes.dart';
import 'package:supabase_flutter_example/home_view_model.dart';

class Home extends HookConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final event =
        ref.watch(homeViewModelProvider.select((value) => value.event));
    useEffect(() {
      return event.listen((value) {
        value.when(showAddClothes: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddClothes()),
          );
        });
      }).cancel;
    }, [event]);
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(),
      floatingActionButton: FloatingActionButton.large(
        onPressed: ref.read(homeViewModelProvider).onAddTapped,
        child: const Icon(Icons.add),
      ),
    );
  }
}
