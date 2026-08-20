class Gift {
  final String id;
  final String name;
  final String category;
  final double price;
  final String shop;
  final String imageUrl;
  final String priority;
  final bool isFavorite;

  const Gift({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.shop,
    required this.imageUrl,
    required this.priority,
    required this.isFavorite,
  });
}