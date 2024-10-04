import 'package:flutter/material.dart';
import '../pages/food.dart' as food; // Ensure this path points to your Food class file

class CartPage extends StatelessWidget {
  final List<food.Food> cartItems;

  const CartPage({Key? key, required this.cartItems}) : super(key: key);

  // Method to calculate the total cost of items in the cart
  double _calculateTotal() {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.price; // Assuming each food item has a price property
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    final total = _calculateTotal(); // Calculate total

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: cartItems.isEmpty
          ? const Center(child: Text('Your cart is empty.'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final foodItem = cartItems[index];
                      return ListTile(
                        leading: Image.asset(foodItem.imageUrl),
                        title: Text(foodItem.name),
                        subtitle: Text('\$${foodItem.price.toStringAsFixed(2)}'),
                      );
                    },
                  ),
                ),
                // Display total cost
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Total: \$${total.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                // Checkout button
                ElevatedButton(
                  onPressed: () {
                    // Handle payment confirmation
                    _showPaymentConfirmation(context);
                  },
                  child: const Text('Checkout'),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
    );
  }

  // Method to show payment confirmation dialog
  void _showPaymentConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirm Payment'),
          content: const Text('Are you sure you want to proceed with the payment?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Logic to confirm payment (e.g., API call)
                Navigator.of(context).pop(); // Close dialog
                _showPaymentSuccess(context); // Show success message
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  // Method to show payment success message
  void _showPaymentSuccess(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Payment Successful'),
          content: const Text('Thank you for your purchase!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                // Optionally, clear cart items or navigate elsewhere
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
