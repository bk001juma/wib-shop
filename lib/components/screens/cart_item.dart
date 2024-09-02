class CartItem {
  final String name;
  final String imageUrl;
  final double price;
  final String description;
  int quantity;

  CartItem({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.description,
    this.quantity = 1,
  });
}
