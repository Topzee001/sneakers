import 'dart:ui';

import 'product.dart';

class CartItem {
  final Sneaker product;
  int quantity;
  String size;
  Color color;

  CartItem({
    required this.product,
    required this.quantity,
     required this.size,
    required this.color,
  });
}
