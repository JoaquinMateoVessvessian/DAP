import 'package:app1/presentation/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  final String username;
  final String? photo;
  final String title;
  final String description;
  const HomeScreen({
    super.key,
    required this.username,
    required this.title,
    this.photo,
    required this.description,
  });


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final groceries = ref.watch(groceriesProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 32),
            Center(
              child: Text(
                'Welcome $username, here you have some groceries',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: groceries.length,
                itemBuilder: (context, index) {
                  final grocery = groceries[index];
                  return Card(
                    child: ListTile(
                      leading: (grocery.photo != null && grocery.photo!.isNotEmpty)
                        ? Image.network(grocery.photo!)
                        : null,
                      title: Text(grocery.title),
                      subtitle: Text(grocery.description),
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
                child:
            FloatingActionButton(
              onPressed: () {
                context.go('/Lista');
              },
              child: Icon(Icons.add),
            ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}