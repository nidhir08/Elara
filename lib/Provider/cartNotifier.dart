import 'package:final_project/Models/CartItem.dart';
import 'package:final_project/formatting.dart';
import 'package:flutter/material.dart';

class Cartnotifier extends ChangeNotifier {
  final List<CartItem> _cartList = [];
  List<CartItem> get cartList => _cartList;
  Formatting design = Formatting();

  void addToCart(CartItem item) {
    int index = _cartList.indexWhere((element) => element.id == item.id);
    if (index != -1) {
      _cartList[index].quantity++;
    } else {
      _cartList.add(item);
    }
    notifyListeners();
  }

  void incQty(int index) {
    if (index >= 0 && index < _cartList.length) {
      _cartList[index].quantity++;
      notifyListeners();
    }
  }

  void decQty(int index) {
    if (index >= 0 && index < _cartList.length) {
      if (_cartList[index].quantity > 1) {
        _cartList[index].quantity--;
      } else {
        _cartList.removeAt(index);
      }
      notifyListeners();
    }
  }

  double totPrice() {
    double total = 0;
    for (var item in _cartList) {
      total += design.toInr(item.price) * item.quantity;
    }
    return total;
  }
}
