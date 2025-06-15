import 'package:flutter/material.dart';

class Lista extends StatefulWidget {
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
  State<Lista> createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _photoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('add Grocerie')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'title'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'description'),
            ),
            TextField(
              controller: _photoController,
              decoration: const InputDecoration(labelText: 'photo URL'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/homescreen');
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}