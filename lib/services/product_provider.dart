import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wibSHOP/services/product_services.dart';

// Define a provider for ProductService
final productServiceProvider = Provider<ProductService>((ref) {
  return ProductService();
});

// Define a FutureProvider for fetching products
final productsProvider = FutureProvider<List<Product>>((ref) async {
  final productService = ref.watch(productServiceProvider);
  return productService.fetchProducts();
});

// Define a StateNotifier for posting products
class ProductPostNotifier extends StateNotifier<AsyncValue<void>> {
  final ProductService _productService;

  ProductPostNotifier(this._productService) : super(const AsyncData(null));

  Future<void> postProduct(Product product) async {
    state = const AsyncValue.loading();
    try {
      await _productService.postProduct(product);
      state = const AsyncValue.data(null);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}

// Define a provider for ProductPostNotifier
final productPostProvider =
    StateNotifierProvider<ProductPostNotifier, AsyncValue<void>>((ref) {
  final productService = ref.watch(productServiceProvider);
  return ProductPostNotifier(productService);
});
