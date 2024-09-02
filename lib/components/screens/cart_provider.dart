import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wibSHOP/components/screens/cart_item.dart';

// Cart item model

// Cart notifier
class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addToCart(
      String name, String imageUrl, double price, String description) {
    // Check if the item is already in the cart
    final existingIndex = state
        .indexWhere((item) => item.name == name && item.imageUrl == imageUrl);
    if (existingIndex >= 0) {
      // Update the quantity if the item is already in the cart
      final updatedItem = state[existingIndex];
      state = [
        ...state
          ..[existingIndex] = CartItem(
            name: updatedItem.name,
            imageUrl: updatedItem.imageUrl,
            price: updatedItem.price,
            description: updatedItem.description,
            quantity: updatedItem.quantity + 1,
          ),
      ];
    } else {
      // Add a new item to the cart
      state = [
        ...state,
        CartItem(
          name: name,
          imageUrl: imageUrl,
          price: price,
          description: description,
        ),
      ];
    }
  }

  void removeFromCart(int index) {
    state = [
      ...state..removeAt(index),
    ];
  }

  void updateQuantity(int index, int newQuantity) {
    final item = state[index];
    state = [
      ...state
        ..[index] = CartItem(
          name: item.name,
          imageUrl: item.imageUrl,
          price: item.price,
          description: item.description,
          quantity: newQuantity,
        ),
    ];
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>(
    (ref) => CartNotifier());
