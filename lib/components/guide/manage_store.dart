// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// // ignore: depend_on_referenced_packages
// import 'package:http_parser/http_parser.dart';
// import 'dart:convert';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
// import 'package:logger/logger.dart';
// import 'package:mime/mime.dart';

// // ProductService class handles API calls
// class ProductService {
//   final String _apiUrl = 'http://192.168.0.28:8000/api/products';
//   final Logger _logger = Logger();

//   Future<List<Product>> fetchProducts() async {
//     try {
//       final response = await http.get(Uri.parse(_apiUrl));

//       if (response.statusCode == 200) {
//         List<dynamic> data = jsonDecode(response.body);
//         return data.map((json) => Product.fromJson(json)).toList();
//       } else {
//         throw Exception('Failed to load products');
//       }
//     } catch (e) {
//       _logger.e('Error fetching products', error: e);
//       rethrow;
//     }
//   }

//   Future<void> postProduct(Product product, File? imageFile) async {
//     try {
//       var request = http.MultipartRequest('POST', Uri.parse(_apiUrl))
//         ..fields['name'] = product.name
//         ..fields['price'] = product.price.toString()
//         ..fields['description'] = product.description;

//       if (imageFile != null) {
//         String? mimeType = lookupMimeType(imageFile.path);
//         if (mimeType == null) {
//           throw Exception('Unable to determine image mime type');
//         }

//         request.files.add(
//           http.MultipartFile.fromBytes(
//             'image',
//             await imageFile.readAsBytes(),
//             filename: imageFile.path.split('/').last,
//             contentType: MediaType.parse(mimeType),
//           ),
//         );
//       }

//       final response = await request.send();

//       if (response.statusCode == 302) {
//         // Handle redirection if needed
//         final responseBody = await response.stream.bytesToString();
//         throw Exception('Redirected: $responseBody');
//       } else if (response.statusCode != 201) {
//         final responseBody = await response.stream.bytesToString();
//         throw Exception(
//             'Failed to post product: ${response.statusCode}, Response: $responseBody');
//       }
//     } catch (e) {
//       _logger.e('Error posting product', error: e);
//       rethrow;
//     }
//   }

//   Future<void> updateProduct(Product product, File? imageFile) async {
//     try {
//       var request =
//           http.MultipartRequest('PUT', Uri.parse('$_apiUrl/${product.id}'))
//             ..fields['name'] = product.name
//             ..fields['price'] = product.price.toString()
//             ..fields['description'] = product.description;

//       if (imageFile != null) {
//         String? mimeType = lookupMimeType(imageFile.path);
//         if (mimeType == null) {
//           throw Exception('Unable to determine image mime type');
//         }

//         request.files.add(
//           http.MultipartFile.fromBytes(
//             'image',
//             await imageFile.readAsBytes(),
//             filename: imageFile.path.split('/').last,
//             contentType: MediaType.parse(mimeType),
//           ),
//         );
//       }

//       final response = await request.send();
//       if (response.statusCode != 200) {
//         final responseBody = await response.stream.bytesToString();
//         throw Exception(
//             'Failed to update product: ${response.statusCode}, Response: $responseBody');
//       }
//     } catch (e) {
//       _logger.e('Error updating product', error: e);
//       rethrow;
//     }
//   }

//   Future<void> deleteProduct(int productId) async {
//     try {
//       final response = await http.delete(Uri.parse('$_apiUrl/$productId'));

//       if (response.statusCode != 200) {
//         throw Exception('Failed to delete product: ${response.statusCode}');
//       }
//     } catch (e) {
//       _logger.e('Error deleting product', error: e);
//       rethrow;
//     }
//   }
// }

// // Product class represents a product entity
// class Product {
//   final int? id;
//   final String name;
//   final String imageUrl;
//   final double price;
//   final String description;

//   Product({
//     this.id,
//     required this.name,
//     required this.imageUrl,
//     required this.price,
//     required this.description,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['id'] as int?,
//       name: json['name'] as String? ?? 'Unknown',
//       imageUrl: json['image'] as String? ?? '',
//       price: (json['price'] as num?)?.toDouble() ?? 0.0,
//       description: json['description'] as String? ?? 'No description',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'price': price,
//       'description': description,
//     };
//   }
// }

// class ManageStorePage extends StatefulWidget {
//   const ManageStorePage({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _ManageStorePageState createState() => _ManageStorePageState();
// }

// class _ManageStorePageState extends State<ManageStorePage> {
//   final List<Product> _products = [];
//   final List<Map<String, dynamic>> _orders = [];
//   File? _selectedImage;

//   final _formKey = GlobalKey<FormState>();
//   String _name = '';
//   double _price = 0;
//   String _description = '';
//   int? _editingIndex;

//   final Logger _logger = Logger();

//   @override
//   void initState() {
//     super.initState();
//     _fetchAndUpdateProducts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Manage Store'),
//           bottom: const TabBar(
//             tabs: [
//               Tab(text: 'Products'),
//               Tab(text: 'Orders'),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             _buildProductTab(),
//             _buildOrderTab(),
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: _showFormDialog,
//           backgroundColor: Colors.purple,
//           child: Icon(Icons.add),
//         ),
//       ),
//     );
//   }

//   Widget _buildProductTab() {
//     return ListView.builder(
//       itemCount: _products.length,
//       itemBuilder: (context, index) {
//         final product = _products[index];
//         return Card(
//           margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//           child: ListTile(
//             leading: product.imageUrl.isNotEmpty
//                 ? Image.network(
//                     product.imageUrl,
//                     width: 50,
//                     height: 50,
//                     fit: BoxFit.cover,
//                   )
//                 : Placeholder(fallbackWidth: 50, fallbackHeight: 50),
//             title: Text(product.name),
//             subtitle: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Price: ${product.price}'),
//                 Text('Description: ${product.description}'),
//               ],
//             ),
//             trailing: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.edit, color: Colors.blue),
//                   onPressed: () => _editProduct(index),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.delete, color: Colors.redAccent),
//                   onPressed: () => _deleteProduct(index),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildOrderTab() {
//     return ListView.builder(
//       itemCount: _orders.length,
//       itemBuilder: (context, index) {
//         final order = _orders[index];
//         return Card(
//           margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//           child: ListTile(
//             title: Text('Order ID: ${order['id']}'),
//             subtitle: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Customer: ${order['customerName']}'),
//                 Text('Product: ${order['productName']}'),
//                 Text('Quantity: ${order['quantity']}'),
//                 Text('Total Price: ${order['totalPrice']}'),
//                 Text('Order Date: ${order['orderDate']}'),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void _showFormDialog() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           contentPadding: EdgeInsets.all(16),
//           content: SizedBox(
//             width: MediaQuery.of(context).size.width * 0.9,
//             height: MediaQuery.of(context).size.height * 0.7,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   _editingIndex == null ? 'Add Product' : 'Edit Product',
//                   style: Theme.of(context).textTheme.titleLarge,
//                 ),
//                 SizedBox(height: 16),
//                 Expanded(
//                   child: SingleChildScrollView(
//                     child: Form(
//                       key: _formKey,
//                       child: Column(
//                         children: [
//                           TextFormField(
//                             initialValue: _name,
//                             decoration:
//                                 InputDecoration(labelText: 'Product Name'),
//                             onSaved: (value) => _name =
//                                 value?.isNotEmpty == true ? value! : _name,
//                             validator: (value) => value == null || value.isEmpty
//                                 ? 'Please enter a product name'
//                                 : null,
//                           ),
//                           TextFormField(
//                             initialValue: _price.toString(),
//                             keyboardType: TextInputType.number,
//                             decoration: InputDecoration(labelText: 'Price'),
//                             onSaved: (value) => _price = value != null
//                                 ? double.tryParse(value) ?? 0
//                                 : _price,
//                             validator: (value) =>
//                                 value == null || double.tryParse(value) == null
//                                     ? 'Please enter a valid price'
//                                     : null,
//                           ),
//                           TextFormField(
//                             initialValue: _description,
//                             decoration:
//                                 InputDecoration(labelText: 'Description'),
//                             onSaved: (value) => _description =
//                                 value?.isNotEmpty == true
//                                     ? value!
//                                     : _description,
//                             validator: (value) => value == null || value.isEmpty
//                                 ? 'Please enter a description'
//                                 : null,
//                           ),
//                           SizedBox(height: 16),
//                           _selectedImage != null
//                               ? Image.file(
//                                   _selectedImage!,
//                                   width: 100,
//                                   height: 100,
//                                   fit: BoxFit.cover,
//                                 )
//                               : Placeholder(
//                                   fallbackWidth: 100,
//                                   fallbackHeight: 100,
//                                 ),
//                           TextButton(
//                             onPressed: _pickImage,
//                             child: Text('Select Image'),
//                           ),
//                           SizedBox(height: 16),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               ElevatedButton(
//                                 onPressed: _submitForm,
//                                 child: Text(_editingIndex == null
//                                     ? 'Add Product'
//                                     : 'Update Product'),
//                               ),
//                               TextButton(
//                                 onPressed: () => Navigator.pop(context),
//                                 child: Text('Cancel'),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Future<void> _pickImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         _selectedImage = File(pickedFile.path);
//       });
//     }
//   }

//   Future<void> _submitForm() async {
//     if (_formKey.currentState?.validate() == true) {
//       _formKey.currentState?.save();

//       final product = Product(
//         id: _editingIndex != null ? _products[_editingIndex!].id : null,
//         name: _name,
//         imageUrl:
//             _selectedImage != null ? '' : _products[_editingIndex!].imageUrl,
//         price: _price,
//         description: _description,
//       );

//       try {
//         final productService = ProductService();
//         if (_editingIndex == null) {
//           await productService.postProduct(product, _selectedImage);
//         } else {
//           await productService.updateProduct(product, _selectedImage);
//         }

//         _fetchAndUpdateProducts();
//         // ignore: use_build_context_synchronously
//         Navigator.pop(context);
//       } catch (e) {
//         _logger.e('Error submitting form', error: e);
//         // Handle error (show dialog or message to user)
//       }
//     }
//   }

//   Future<void> _fetchAndUpdateProducts() async {
//     try {
//       final productService = ProductService();
//       final products = await productService.fetchProducts();
//       setState(() {
//         _products.clear();
//         _products.addAll(products);
//       });
//     } catch (e) {
//       _logger.e('Error fetching products', error: e);
//       // Handle error (show dialog or message to user)
//     }
//   }

//   void _editProduct(int index) {
//     final product = _products[index];
//     setState(() {
//       _name = product.name;
//       _price = product.price;
//       _description = product.description;
//       _selectedImage = null; // Handle the image if necessary
//       _editingIndex = index;
//     });

//     _showFormDialog();
//   }

//   Future<void> _deleteProduct(int index) async {
//     final productId = _products[index].id;
//     if (productId != null) {
//       try {
//         final productService = ProductService();
//         await productService.deleteProduct(productId);
//         setState(() {
//           _products.removeAt(index);
//         });
//       } catch (e) {
//         _logger.e('Error deleting product', error: e);
//         // Handle error (show dialog or message to user)
//       }
//     }
//   }
// }
