import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> products = [
      "Producto 1",
      "Producto 2",
      "Producto 3",
      "Producto 4",
    ];

    return Scaffold(
      appBar: AppBar(title: Text("Productos")),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index]),
            leading: Icon(Icons.shopping_bag),
          );
        },
      ),
    );
  }
}
