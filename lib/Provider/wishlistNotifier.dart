import 'package:final_project/Models/wishlist_item.dart';
import 'package:flutter/material.dart';

class WishlistNotifier extends ChangeNotifier {
  final List<WishlistItem> _wishlist = [];

  List<WishlistItem> get wishlist => _wishlist;

  void addToWishlist(WishlistItem item) {
    if (!_wishlist.any((i)=> i.id == item.id)) {
      _wishlist.add(item);
      notifyListeners(); // Notify listeners of the change
    }
  }

  void removeFromWishlist(String id) {
    _wishlist.removeWhere((item)=> item.id ==id);
    notifyListeners(); // Notify listeners of the change
  }
}