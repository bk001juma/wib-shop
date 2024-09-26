import 'package:flutter_riverpod/flutter_riverpod.dart';

// Cart item model
class CartItemModel {
  final String name;
  final String image;
  final double price;
  final String description;
  int quantity;

  CartItemModel({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    this.quantity = 1,
  });
}

// Cart notifier
class CartNotifier extends StateNotifier<List<CartItemModel>> {
  CartNotifier() : super([]);

  void addToCart(String name, String image, double price, String description) {
    // Check if the item is already in the cart
    final existingIndex =
        state.indexWhere((item) => item.name == name && item.image == image);
    if (existingIndex >= 0) {
      // Update the quantity if the item is already in the cart
      final updatedItem = state[existingIndex];
      updatedItem.quantity++;
      state = [
        ...state..[existingIndex] = updatedItem
      ]; // Update state with incremented quantity
    } else {
      // Add a new item to the cart
      state = [
        ...state,
        CartItemModel(
          name: name,
          image: image,
          price: price,
          description: description,
        ),
      ];
    }
  }

  void removeFromCart(int index) {
    state = [...state..removeAt(index)];
  }

  void updateQuantity(int index, int newQuantity) {
    final item = state[index];
    state = [
      ...state
        ..[index] = CartItemModel(
          name: item.name,
          image: item.image,
          price: item.price,
          description: item.description,
          quantity: newQuantity,
        ),
    ];
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItemModel>>(
  (ref) => CartNotifier(),
);
