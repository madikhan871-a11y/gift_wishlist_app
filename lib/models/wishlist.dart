import 'gift.dart';

class Wishlist {
  final String title;
  final String occasion;
  final List<Gift> gifts;

  const Wishlist({
    required this.title,
    required this.occasion,
    required this.gifts,
  });

  double get totalValue {
    return gifts.fold(
      0,
          (total, gift) => total + gift.price,
    );
  }

  int get itemCount => gifts.length;
}