import 'package:flutter/material.dart';
import 'package:app1/entities/groceries.dart';
import 'package:go_router/go_router.dart';

final List<Groceries> groceries = [
    Groceries(title: 'Carrot', photo: 'https://makipura.uy/wp-content/uploads/2019/12/p9.jpg', description: 'A crunchy, sweet, orange root rich in vitamin A.'),  
    Groceries(title: 'Potato', photo: 'https://www.superaki.mx/cdn/shop/products/0000000000147_300x300.png?v=1634911468', description: ' starchy, edible tuber with thin or thick skin and white or yellow flesh.'),
    Groceries(title: 'Lettuce', photo: 'https://cdn.britannica.com/77/170677-050-F7333D51/lettuce.jpg', description: 'A leafy green vegetable, crisp and mild in flavor, commonly used in salads'),
    Groceries(title: 'Apple', photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtkzZMTh_n9DE3CznuCnA8wVdQI7IQT9sDng&s', description: 'A sweet, crisp fruit with smooth skin, available in various colors like red, green, and yellow.'),
    Groceries(title: 'Orange', photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZbB_doR9LVg_xVbDXOOZc3TNbgNCEIzLLKw&s', description: 'A juicy, sweet citrus fruit with a bright orange peel and high vitamin C content.'),
    Groceries(title: 'Tomato', photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpTX80L1o0BjWIj5axuzobiYhPRoj5zdaUwA&s', description: 'A soft, juicy fruit often red, used as a vegetable in cooking, with a slightly sweet and tangy flavor.'),
  ];

class HomeScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
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