
import 'package:final_project/Provider/wishlistNotifier.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: Consumer<WishlistNotifier>(
        builder: (context, wishlistNotifier, child) {
          final wishlistItems = wishlistNotifier.wishlist;
          return wishlistItems.isEmpty
              ? Center(child: Text('No items in the wishlist'))
              : ListView.builder(
                  itemCount: wishlistItems.length,
                  itemBuilder: (context, index) {
                    final item = wishlistItems[index];
                    return Card(
                      child: ListTile(
                        leading: Image.network(item.thumbnail),
                        title: Text(item.title, style: GoogleFonts.playfairDisplay(fontSize: 16)),
                        subtitle: Text('\$${item.price}', style: GoogleFonts.playfairDisplay(fontSize: 14)),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red) ,
                          onPressed: (){
                            Provider.of<WishlistNotifier>(context,listen: false).removeFromWishlist(item.id);
                          },
                          ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}

