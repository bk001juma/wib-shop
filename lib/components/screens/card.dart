import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wibshop/components/screens/product_details.dart';
import 'package:wibshop/services/product_provider.dart';

class ProductCard extends ConsumerWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync =
        ref.watch(productsProvider); // Fetch products using Riverpod

    return Column(
      children: [
        const Text(
          "New Arrivals",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        productsAsync.when(
          data: (products) {
            final limitedProducts = products.take(10).toList();
            return CarouselSlider(
              options: CarouselOptions(
                height: 300.0,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              items: limitedProducts.map((product) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        // Navigate to ProductDetailsScreen when image is clicked
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
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.memory(
                            base64.decode(product.image), // Display only image
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.error);
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            );
          },
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Failed to load products: $error'),
        ),
      ],
    );
  }
}
