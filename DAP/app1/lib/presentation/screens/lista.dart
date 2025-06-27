import 'package:app1/presentation/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:app1/entities/groceries.dart';

class Lista extends ConsumerStatefulWidget {
  final String title;
  final String photo;
  final String description;
  const Lista({
    super.key,
    required this.title,
    required this.photo,
    required this.description,
  });

  @override
  ConsumerState<Lista> createState() => _ListaState();
}

class _ListaState extends ConsumerState<Lista> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController photoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('add grocery')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'description'),
            ),
            TextField(
              controller: photoController,
              decoration: const InputDecoration(labelText: 'photo URL'),
            ),
            const SizedBox(height: 24),
            TextButton(
              onPressed: () {
                Groceries newGrocery = Groceries(
                  title: titleController.text,
                  photo: photoController.text,
                  description: descriptionController.text,
                );
                List<Groceries> grocery1 = ref.read(groceriesProvider.notifier).state;
                ref.read(groceriesProvider.notifier).state = [
                  ...grocery1,
                  newGrocery
                ];
                context.go('/home');
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  } 
}