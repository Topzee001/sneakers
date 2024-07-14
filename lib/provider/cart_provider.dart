import 'package:flutter/material.dart';
import '../model/product.dart';
import '../services/product_service.dart';

class CartProvider with ChangeNotifier {
  List<Sneaker> _products = [];
  final List<Sneaker> _cartItems = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Sneaker> get products => _products;
  List<Sneaker> get cartItems => _cartItems;

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

  void addToCart(Sneaker product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(Sneaker product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  double get totalPrice {
    double total = 0.0;
    for (var item in _cartItems) {
      total += item.price;
    }
    return total;
  }
}
