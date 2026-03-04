class Product {
  final String id;
  final String name;
  final String brand;
  final double price;
  final String description;
  final String imageUrl;
  final bool isUpcoming;
  final String? releaseDate;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.isUpcoming,
    this.releaseDate,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      brand: json['brand'],
      price: json['price'].toDouble(),
      description: json['description'],
      imageUrl: json['imageUrl'],
      isUpcoming: json['isUpcoming'],
      releaseDate: json['releaseDate'],
    );
  }
}
