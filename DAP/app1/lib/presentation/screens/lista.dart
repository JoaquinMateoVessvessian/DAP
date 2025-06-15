import 'package:flutter/material.dart';

class Lista extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        children: [
          Image.network(photo),
          Text(description),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }
}