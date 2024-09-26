import 'package:flutter/material.dart';
import 'package:wibshop/components/cart/cart_provider.dart';

// Cart item model
class CartItem {
  final String name;
  final String image;
  final double price;
  final String description;
  int quantity;

  CartItem({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    this.quantity = 1,
  });
}

class CartItemWidget extends StatelessWidget {
  final CartItemModel items; // Make sure this matches CartItemModel
  final Function(int) onQuantityChanged;
  final VoidCallback onRemove;

  const CartItemWidget({
    super.key,
    required this.items,
    required this.onQuantityChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(items.name),
      subtitle: Text("Price: Tsh${items.price}"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () => onQuantityChanged(items.quantity - 1),
          ),
          Text('${items.quantity}'),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => onQuantityChanged(items.quantity + 1),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: onRemove,
          ),
        ],
      ),
    );
  }
}
