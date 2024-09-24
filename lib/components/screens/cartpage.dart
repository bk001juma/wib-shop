import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wibshop/components/screens/cart_item.dart';
import 'package:wibshop/components/screens/product_display.dart';
import 'package:wibshop/services/product_provider.dart';
import 'package:wibshop/components/screens/cart_provider.dart';

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
                      final item =
                          cartItems[index]; // This is of type CartItemModel
                      return CartItemWidget(
                        items: item, // Pass the CartItemModel directly
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
                    crossAxisCount: 2, // Two products in horizontal
                    childAspectRatio: 0.75, // Adjust aspect ratio if needed
                  ),
                  itemCount: limitedProducts.length,
                  itemBuilder: (context, index) {
                    final product = limitedProducts[index];
                    return ProductDisplay(
                      name: product.name,
                      image: product.image,
                      price: product.price,
                      description: product.description,
                      showAddToCartButton: true, // Show button on CartPage
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
