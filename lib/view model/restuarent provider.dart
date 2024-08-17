// providers/order_provider.dart

import 'package:flutter/material.dart';
import 'package:tuchtrip_staff_portal/view/Restuarent/dashboard.dart';

class OrderProvider with ChangeNotifier {
  List<OrderItem> _items = [
    OrderItem(
        name: 'Cappuccino',
        price: 8.0,
        imagePath: 'assests/images/cappuccino.jpg'),
    OrderItem(
        name: 'Matcha Latte',
        price: 10.0,
        quantity: 2,
        imagePath: 'assests/images/matche lette.jpg'),
    OrderItem(
        name: 'Iced Coffee',
        price: 8.0,
        imagePath: 'assests/images/iced coffee.jpeg'),
    OrderItem(
        name: 'Fruit Smoothies',
        price: 7.0,
        imagePath: 'assests/images/fruit smoothies.jpeg'),
  ];

  List<OrderItem> get items => _items;

  void updateQuantity(int index, int newQuantity) {
    if (newQuantity >= 1) {
      _items[index].quantity = newQuantity;
      notifyListeners();
    }
  }

  double get totalPrice {
    return _items.fold(0.0, (sum, item) => sum + item.price * item.quantity);
  }

  int get totalItems {
    return _items.fold(0, (sum, item) => sum + item.quantity);
  }

  //============================================================================
  //================ Category index ============================================

  int _selectedCategoryIndex = 0;

  int get selectedCategoryIndex => _selectedCategoryIndex;

  void selectCategory(int index) {
    _selectedCategoryIndex = index;
    notifyListeners();
  }
}
