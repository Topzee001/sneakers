class Sneaker {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String category;
  final int quantity;
  final String uniqueId;

  Sneaker({
    required this.category,
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.price,
    this.quantity = 1,
    required this.uniqueId,
  });

  factory Sneaker.fromJson(Map<String, dynamic> json) {
    final photos = json['photos'] as List<dynamic>?;
    final imageUrl = (photos != null && photos.isNotEmpty)
        ? 'https://api.timbu.cloud/images/${photos[0]['url']}'
        : '';
    final price = json['current_price']?[0]['NGN']?[0]?.toDouble() ?? 0.0;
    final category = json['categories'][0]['name'];
    return Sneaker(
      id: json['id'],
      name: json['name'] ?? 'Unknown Sneaker',
      category: category,
      imageUrl: imageUrl,
      price: price,
      uniqueId: json['unique_id'],
      quantity: 1,
    );
  }
}
