import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "My app",
      home: ShoppingList(
        products: List.generate(20, (i) {
          return Product(
            name: null,
            description: null,
          );
        }),
      ),
    ));

class Product {
  Product({this.name, this.description});
  final String name;
  final String description;
}

class ShoppingList extends StatelessWidget {
  final List<Product> products;
  ShoppingList({Key key, @required this.products}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Products",
        ),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListDetails(
                    product: products[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ListDetails extends StatelessWidget {
  final Product product;
  ListDetails({Key key, @required this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Text(
        product.description,
      ),
    );
  }
}
