import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Product {
  String name;
  double price;
  int quantity;

  Product({required this.name, required this.price, required this.quantity});
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<Product> products = [
    Product(name: 'Foxtail Skincare', price: 1200.0, quantity: 2),
    Product(name: 'MamaEarth Skincare', price: 2000.0, quantity: 1),
    Product(name: 'Rice and Sushi', price: 1575.0, quantity: 3),
    Product(name: 'Burgers and Fries', price: 300.0, quantity: 1),
    Product(name: 'Hat', price: 2500.0, quantity: 4),
    Product(name: 'Sunglasses', price: 500.0, quantity: 10),
    Product(name: 'Vintage Dress', price: 5000.0, quantity: 1),
    Product(name: 'Mobile Phone', price: 40000.0, quantity: 2),
    Product(name: 'Apple Laptop', price: 60000.0, quantity: 1),
    Product(name: 'Apple iPad', price: 70000.0, quantity: 3),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Order History',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Product Order History Page',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 231, 171, 245),
        ),
        body: ListView.builder(
          itemCount: products.length + 1, // +1 for divider at end
          itemBuilder: (context, index) {
            if (index == products.length) {
              // Divider at the end
              return const Divider(
                thickness: 2,
                color: Colors.grey,
                indent: 16,
                endIndent: 16,
              );
            }

            final product = products[index];
            return Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor:
                        const Color.fromARGB(255, 231, 171, 245),
                    child: Text(
                      product.name[0],
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Text(
                    product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    'Price: ₹${product.price.toStringAsFixed(2)}\nQuantity: ${product.quantity}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  trailing: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor:
                          const Color.fromARGB(255, 231, 171, 245),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text(
                            'Product Order Details',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          content: Text(
                            "${product.name} ordered at ₹${product.price.toStringAsFixed(2)}\nQuantity: ${product.quantity}",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Close'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text(
                      'Click to Order More!',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('You clicked on ${product.name}'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                ),
                const Divider(thickness: 1, color: Colors.grey),
              ],
            );
          },
        ),
      ),
    );
  }
}
