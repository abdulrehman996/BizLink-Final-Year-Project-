import 'package:flutter/material.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.add_shopping_cart_rounded,
            size: 52,
            color: Colors.grey,
          ),
          const SizedBox(height: 8),
          const Text(
            'Cart is empty',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            'To buy anything you have to add products in the cart, currently their is nothing in the cart to display',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
          // TextButton.icon(
          //   onPressed: () {
          //     // Provider.of<AppProvider>(context, listen: false).onTabTapped(0);
          //   },
          //   icon: const Icon(Icons.add_shopping_cart_outlined),
          //   label: const Text('click here to add in Cart'),
          // ),
        ],
      ),
    );
  }
}
