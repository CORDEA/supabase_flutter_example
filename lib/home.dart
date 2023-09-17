import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'add_clothes.dart';
import 'clothes.dart';
import 'home_view_model.dart';

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
      appBar: AppBar(),
      body: Consumer(builder: (context, ref, _) {
        final index =
            ref.watch(homeViewModelProvider.select((value) => value.index));
        return IndexedStack(
          index: index,
          children: const [
            Clothes(),
          ],
        );
      }),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Account',
          ),
        ],
        onTap: ref.read(homeViewModelProvider).onBottomItemChanged,
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, _) {
          final visible = ref.watch(
              homeViewModelProvider.select((value) => value.visibleAdd));
          if (visible) {
            return FloatingActionButton.large(
              onPressed: ref.read(homeViewModelProvider).onAddTapped,
              child: const Icon(Icons.add),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
