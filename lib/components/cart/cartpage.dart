import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wibshop/components/cart/cart_provider.dart';
import 'package:wibshop/components/homescreen/product_display.dart';
import 'package:wibshop/services/product_provider.dart';

class CartPage extends ConsumerWidget {
  final String logoImage = "asset/images/logo.png";

  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    final recommendedProductsAsync = ref.watch(productsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        backgroundColor: const Color.fromARGB(255, 238, 200, 245),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(logoImage),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return CartItemWidget(
                        item: item,
                        onQuantityChanged: (newQuantity) {
                          ref
                              .read(cartProvider.notifier)
                              .updateQuantity(index, newQuantity);
                        },
                        onRemove: () {
                          ref.read(cartProvider.notifier).removeFromCart(index);
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    "Total: Tsh${cartItems.fold(0.0, (sum, item) => sum + (item.price * item.quantity)).toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Text("Delivery Option:"),
                  const SizedBox(width: 16.0),
                  DropdownButton<String>(
                    value: 'Home Delivery',
                    items: const <String>['Home Delivery', 'Store Pickup']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {}, // Handle delivery option change
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Handle checkout
                },
                child: const Text("Proceed to Checkout"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                "Recommended for You",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            recommendedProductsAsync.when(
              data: (products) {
                final limitedProducts = products.take(4).toList();
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: limitedProducts.length,
                  itemBuilder: (context, index) {
                    final product = limitedProducts[index];
                    return ProductDisplay(
                      name: product.name,
                      image: product.image,
                      price: product.price,
                      description: product.description,
                      showAddToCartButton: true,
                      onAddToCart: () {
                        ref.read(cartProvider.notifier).addToCart(
                              product.name,
                              product.image,
                              product.price,
                              product.description,
                            );
                      },
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) =>
                  Center(child: Text('Failed to load products')),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final CartItemModel item;
  final ValueChanged<int> onQuantityChanged;
  final VoidCallback onRemove;

  const CartItemWidget({
    required this.item,
    required this.onQuantityChanged,
    required this.onRemove,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.memory(
        base64.decode(item.image),
        width: 50,
        height: 50,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.error);
        },
      ),
      title: Text(item.name),
      subtitle: Row(
        children: [
          Text('Tsh${item.price} x ${item.quantity}'),
          const SizedBox(width: 16),
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: item.quantity > 1
                ? () => onQuantityChanged(item.quantity - 1)
                : null,
          ),
          Text(item.quantity.toString()),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => onQuantityChanged(item.quantity + 1),
          ),
        ],
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: onRemove,
      ),
    );
  }
}
