import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductService {
  final String _fetchApiUrl =
      'http://192.168.43.135:8000/api/products'; // URL for fetching products
  final String _postApiUrl =
      'http://192.168.43.135:8000/api/products'; // URL for posting products

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(_fetchApiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
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
      throw Exception('Failed to post product');
    }
  }
}

class Product {
  final int id;
  final String name;
  final String imageUrl;
  final double price;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'] as String? ?? 'Unknown',
      imageUrl: json['image'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      description: json['description'] as String? ?? 'No description',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': imageUrl,
      'price': price,
      'description': description,
    };
  }
}
