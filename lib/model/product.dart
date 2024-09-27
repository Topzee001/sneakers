class Sneaker {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String category;
  final int quantity;
  final String uniqueId;
  final String? description;

  Sneaker({
    required this.category,
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.price,
    this.quantity = 1,
    required this.uniqueId,
    this.description,
  });

  factory Sneaker.fromJson(Map<String, dynamic> json) {
    final photos = json['photos'] as List<dynamic>?;
    final imageUrl = (photos != null && photos.isNotEmpty)
        ? 'https://api.timbu.cloud/images/${photos[0]['url']}'
        : '';
    final price = json['current_price']?[0]['NGN']?[0]?.toDouble() ?? 0.0;
    //final category = json['categories'][0]['name'];
    final ctg = json['categories'];
    final category = ctg.isEmpty ? "" : ctg[0]?['name']?.toString() ?? "0";
    return Sneaker(
      id: json['id'],
      name: json['name'] ?? 'Unknown Sneaker',
      category: category,
      imageUrl: imageUrl,
      price: price,
      uniqueId: json['unique_id'],
      quantity: 1,
      description: json['description'] ?? 'No description available',
    );
  }
}
