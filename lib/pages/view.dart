import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}

class ShoppingCart {
  final List<Product> items = [];
}

class ViewPage extends StatefulWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  final ShoppingCart cart = ShoppingCart();

  final List<Product> products = [
    Product(name: 'Product 1', price: 20.0),
    Product(name: 'Product 2', price: 15.0),
    Product(name: 'Product 3', price: 25.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].name),
            subtitle: Text('\$${products[index].price.toString()}'),
            trailing: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                addToCart(products[index]);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openShoppingCart();
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }

  void addToCart(Product product) {
    setState(() {
      cart.items.add(product);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} added to cart'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void openShoppingCart() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            ShoppingCartPage(cart: cart, onDelete: deleteFromCart),
      ),
    );
  }

  void deleteFromCart(Product product) {
    setState(() {
      cart.items.remove(product);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} removed from cart'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}

class ShoppingCartPage extends StatelessWidget {
  final ShoppingCart cart;
  final Function(Product) onDelete;

  const ShoppingCartPage(
      {super.key, required this.cart, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cart.items[index].name),
            subtitle: Text('\$${cart.items[index].price.toString()}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                onDelete(cart.items[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
