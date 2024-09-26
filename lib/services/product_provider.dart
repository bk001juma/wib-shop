import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wibshop/services/product_services.dart';

// Define a StateNotifier for managing product fetching
class ProductNotifier extends StateNotifier<AsyncValue<List<Product>>> {
  final ProductService _productService;

  ProductNotifier(this._productService) : super(const AsyncValue.loading()) {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final products = await _productService.fetchProducts();
      if (mounted) {
        // Ensure notifier is still mounted before updating state
        state = AsyncValue.data(products);
      }
    } catch (error, stackTrace) {
      if (mounted) {
        // Also check here to avoid setting state after dispose
        state = AsyncValue.error(error, stackTrace);
      }
    }
  }

  Future<void> getProductsByCategory(String category) async {
    state = const AsyncValue.loading(); // Set state to loading
    try {
      final products = await _productService.getProductsByCategory(category);
      if (mounted) {
        state = AsyncValue.data(products); // Update state with fetched products
      }
    } catch (error, stackTrace) {
      if (mounted) {
        state = AsyncValue.error(error, stackTrace); // Handle error
      }
    }
  }
}

// Define a provider for ProductService
final productServiceProvider = Provider<ProductService>((ref) {
  return ProductService();
});

// Define a provider for ProductNotifier
final productsProvider =
    StateNotifierProvider<ProductNotifier, AsyncValue<List<Product>>>((ref) {
  final productService = ref.watch(productServiceProvider);
  return ProductNotifier(productService);
});

// Define a StateNotifier for posting products
class ProductPostNotifier extends StateNotifier<AsyncValue<void>> {
  final ProductService _productService;

  ProductPostNotifier(this._productService) : super(const AsyncData(null));

  Future<void> postProduct(Product product) async {
    state = const AsyncValue.loading();
    try {
      await _productService.postProduct(product);
      if (mounted) {
        // Ensure notifier is still mounted before updating state
        state = const AsyncValue.data(null);
      }
    } catch (e, stackTrace) {
      if (mounted) {
        // Also check here to avoid setting state after dispose
        state = AsyncValue.error(e, stackTrace);
      }
    }
  }
}

// Define a provider for ProductPostNotifier
final productPostProvider =
    StateNotifierProvider<ProductPostNotifier, AsyncValue<void>>((ref) {
  final productService = ref.watch(productServiceProvider);
  return ProductPostNotifier(productService);
});
