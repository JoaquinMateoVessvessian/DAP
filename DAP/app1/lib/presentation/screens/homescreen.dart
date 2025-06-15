import 'package:flutter/material.dart';
import 'package:app1/entities/groceries.dart';

class HomeScreen extends StatelessWidget {
  final String name;
  final String mail;
  HomeScreen({super.key, required this.name, required this.mail});

  final List<Groceries> groceries = [
    Groceries(title: 'Carrot', photo: 'https://makipura.uy/wp-content/uploads/2019/12/p9.jpg', description: 'A crunchy, sweet, orange root rich in vitamin A.'),  
    Groceries(title: 'Potato', photo: 'https://www.superaki.mx/cdn/shop/products/0000000000147_300x300.png?v=1634911468', description: ' starchy, edible tuber with thin or thick skin and white or yellow flesh.'),
    Groceries(title: 'Lettuce', photo: 'https://cdn.britannica.com/77/170677-050-F7333D51/lettuce.jpg', description: 'A leafy green vegetable, crisp and mild in flavor, commonly used in salads'),
    Groceries(title: 'Apple', photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtkzZMTh_n9DE3CznuCnA8wVdQI7IQT9sDng&s', description: 'A sweet, crisp fruit with smooth skin, available in various colors like red, green, and yellow.'),
    Groceries(title: 'Orange', photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZbB_doR9LVg_xVbDXOOZc3TNbgNCEIzLLKw&s', description: 'A juicy, sweet citrus fruit with a bright orange peel and high vitamin C content.'),
    Groceries(title: 'Tomato', photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpTX80L1o0BjWIj5axuzobiYhPRoj5zdaUwA&s', description: 'A soft, juicy fruit often red, used as a vegetable in cooking, with a slightly sweet and tangy flavor.'),
  ];

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
                'Welcome $name, here you have some',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'Groceries',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.red),
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
                      leading: Image.network(grocery.photo),
                      title: Text(grocery.title),
                      subtitle: Text(grocery.description),
                    ),
                  );
                },
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}