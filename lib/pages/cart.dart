import 'package:flutter/material.dart';

// Model class for cart items
class CartItem {
  final String foodName;
  final int quantity;
  final double price;

  CartItem({
    required this.foodName,
    required this.quantity,
    required this.price,
  });
}

class CartPage extends StatelessWidget {
  final List<CartItem> cartItems;

  const CartPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double total = cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        actions: [
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              // Handle clear cart action
              // Show a Snackbar for feedback
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Cart cleared.')),
              );
            },
          ),
        ],
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Your cart is empty.'),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate back to the home page or restaurant list
                      Navigator.pop(context); // Example action
                    },
                    child: const Text('Go to Home'),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return ListTile(
                        title: Text(item.foodName),
                        subtitle: Text('Quantity: ${item.quantity}'),
                        trailing: Text('\$${(item.price * item.quantity).toStringAsFixed(2)}'),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Total: \$${total.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle checkout action (e.g., navigate to payment page)
                    // Show a Snackbar for feedback
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Proceeding to checkout...')),
                    );
                  },
                  child: const Text('Checkout'),
                ),
              ],
            ),
    );
  }
}
