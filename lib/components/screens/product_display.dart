import 'dart:convert';

import 'package:flutter/material.dart';

class ProductDisplay extends StatelessWidget {
  final String image;
  final String name;
  final double price;
  final String description;
  final VoidCallback? onAddToCart; // Optional callback
  final bool showAddToCartButton;

  const ProductDisplay({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    this.onAddToCart, // Optional
    this.showAddToCartButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 1,
            color: Color.fromARGB(255, 187, 186, 186),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _buildProductImage(image)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  'Tsh${price.toStringAsFixed(2)}',
                  style: const TextStyle(color: Colors.red, fontSize: 14),
                ),
                Text(
                  description,
                  style: const TextStyle(color: Colors.black, fontSize: 12),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (showAddToCartButton)
                  ElevatedButton(
                    onPressed: onAddToCart,
                    child: const Text('Add to Cart'),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductImage(String base64String) {
    return Image.memory(
      base64.decode(base64String),
      width: double.infinity,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.error);
      },
    );
  }
}
