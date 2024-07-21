import 'package:flutter/material.dart';
import '../model/cart.dart';
import '../model/product.dart';
import '../services/product_service.dart';

class CartProvider with ChangeNotifier {
  List<Sneaker> _products = [];
  List<Sneaker> _favourites = [];

  Map<String, CartItem> _cartItems = {};
  bool _isLoading = false;
  String? _errorMessage;

  List<Sneaker> get products => _products;
  List<Sneaker> get favourites => _favourites;
  Map<String, CartItem> get cartItems => _cartItems;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchSneakers() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _products = await ApiService().fetchSneakers();
    } catch (error) {
      _errorMessage = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Sneaker? getSneakerById(String id) {
    try {
      return _products.firstWhere((sneaker) => sneaker.id == id);
    } catch (e) {
      return null;
    }
  }

  void toggleFavourite(Sneaker sneaker) {
    if (_favourites.contains(sneaker)) {
      _favourites.remove(sneaker);
    } else {
      _favourites.add(sneaker);
    }

    notifyListeners();
  }

  bool isExist(Sneaker sneaker) {
    final isExist = _favourites.contains(sneaker);
    return isExist;
  }



  void addToCart(Sneaker sneaker, int quantity, String size, Color color) {
    if (_cartItems.containsKey(sneaker.id)) {
      _cartItems.update(
          sneaker.id,
          (existingItem) => CartItem(
                product: existingItem.product,
                quantity: quantity,
                size: size,
                color: color,
              ));
    } else {
      _cartItems.putIfAbsent(
          sneaker.id,
          () => CartItem(
                product: sneaker,
                quantity: quantity,
                size: size,
                color: color,
              ));
    }
    notifyListeners();
  }

  void removeFromCart(String sneakerId) {
    _cartItems.remove(sneakerId);
    notifyListeners();
  }

  void updateQuantity(String sneakerId, int newQuantity) {
    if (_cartItems.containsKey(sneakerId)) {
      _cartItems.update(
          sneakerId,
          (existingItem) => CartItem(
                product: existingItem.product,
                quantity: newQuantity,
                size: existingItem.size,
                color: existingItem.color,
              ));
      notifyListeners();
    }
  }

  double updateSingleProductTotalPrice(String sneakerId, int quantity) {
    Sneaker? sneaker = getSneakerById(sneakerId);
    if (sneaker == null) {
      return 0.0;
    }
    return sneaker.price * quantity;
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  double get totalPrice {
    double total = 0.0;
    _cartItems.forEach((key, cartItem) {
      total += cartItem.product.price * cartItem.quantity;
    });
    return total;
  }
}
