import 'package:flutter/material.dart';

class AddClothes extends StatelessWidget {
  const AddClothes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add clothes')),
      body: const Center(),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {},
        child: const Icon(Icons.check),
      ),
    );
  }
}
