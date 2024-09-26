// category_products_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wibshop/components/homescreen/product_details.dart';
import 'package:wibshop/services/product_provider.dart';
import 'package:wibshop/components/homescreen/product_display.dart';

class CategoryProductsScreen extends ConsumerWidget {
  final String category;

  const CategoryProductsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsyncValue = ref.watch(productsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: productsAsyncValue.when(
        data: (products) {
          // Filter products by category
          final filteredProducts = products
              .where((product) =>
                  product.category.toLowerCase() == category.toLowerCase())
              .toList();
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: filteredProducts.length,
            itemBuilder: (context, index) {
              final product = filteredProducts[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsScreen(
                        name: product.name,
                        image: product.image,
                        price: product.price,
                        description: product.description,
                      ),
                    ),
                  );
                },
                child: ProductDisplay(
                  image: product.image,
                  name: product.name,
                  price: product.price,
                  description: product.description,
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
