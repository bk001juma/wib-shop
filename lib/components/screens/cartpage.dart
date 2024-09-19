import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wibSHOP/components/screens/cart_item.dart';
import 'package:wibSHOP/services/product_provider.dart';
import 'package:wibSHOP/components/screens/cart_provider.dart';

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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(logoImage),
                  ),
                )
              ],
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
                    onChanged: (newValue) {},
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
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 8.0),
                      child: Column(
                        children: [
                          Image.network(
                            product.imageUrl,
                            width: double.infinity,
                            height: 100,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.error, size: 100);
                            },
                          ),
                          Text(product.name),
                          Text("Tsh${product.price.toStringAsFixed(2)}"),
                          ElevatedButton(
                            onPressed: () {
                              ref.read(cartProvider.notifier).addToCart(
                                    product.name,
                                    product.imageUrl,
                                    product.price,
                                    product.description,
                                  );
                            },
                            child: const Text("Add to Cart"),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) =>
                  Center(child: Text('Failed to load products')),
            )
          ],
        ),
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final Function(int) onQuantityChanged;
  final Function() onRemove;

  const CartItemWidget({
    super.key,
    required this.item,
    required this.onQuantityChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        item.imageUrl,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.error, size: 50);
        },
      ),
      title: Text(item.name),
      subtitle: Text("Tsh${item.price.toStringAsFixed(2)}"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(
              Icons.remove,
              color: Colors.orange,
            ),
            onPressed: () {
              if (item.quantity > 1) {
                onQuantityChanged(item.quantity - 1);
              }
            },
          ),
          Text(item.quantity.toString()),
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.green,
            ),
            onPressed: () => onQuantityChanged(item.quantity + 1),
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: onRemove,
          ),
        ],
      ),
    );
  }
}
