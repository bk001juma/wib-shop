import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductService {
  final String _fetchApiUrl =
      'http://192.168.0.38:8080/api/products/get'; // URL for fetching products
  final String _postApiUrl =
      'http://192.168.0.38:8080/api/products'; // URL for posting products

  // Method to fetch all products
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(_fetchApiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products: ${response.statusCode}');
    }
  }

  // Method to fetch products by category
  Future<List<Product>> getProductsByCategory(String category) async {
    final response =
        await http.get(Uri.parse('$_fetchApiUrl?category=$category'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception(
          'Failed to load products for category $category: ${response.statusCode}');
    }
  }

  Future<void> postProduct(Product product) async {
    final response = await http.post(
      Uri.parse(_postApiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(product.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to post product: ${response.statusCode}');
    }
  }
}

class Product {
  final int id;
  final String name;
  final String image;
  final double price;
  final String description;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'] as String? ?? 'Unknown',
      image: json['image'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      description: json['description'] as String? ?? 'No description',
      category: json['category'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'description': description,
      'category': category,
    };
  }
}
