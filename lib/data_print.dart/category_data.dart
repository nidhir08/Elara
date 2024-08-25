
import 'package:final_project/Models/wishlist_item.dart';
import 'package:final_project/Provider/wishlistNotifier.dart';
import 'package:final_project/formatting.dart';
import 'package:final_project/image_slideshow.dart';
import 'package:final_project/screens/product_screen.dart';
import 'package:final_project/services/category_info.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoryData extends StatelessWidget {
  const CategoryData({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    Formatting design = Formatting();
    var obj = CategoryInfo();
    return FutureBuilder<Map<String, dynamic>?>(
      future: obj.getinfo(name),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color.fromRGBO(108, 76, 54, 1),
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Connection Lost !"),
          );
        } else if (snapshot.hasData) {
          var data = snapshot.data;
          var products = data?["products"] ?? [];
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Card(
                shadowColor: const Color.fromRGBO(108, 76, 54, 1),
                margin: const EdgeInsets.all(10),
                elevation: 5,
                color: Colors.white,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          //decoration:
                          // const BoxDecoration(
                          //     border: Border(
                          //         bottom: BorderSide(
                          //             color: Color.fromRGBO(108, 76, 54, 1),),),),
                          child: Column(
                            children: [
                              ImageSlideshower(images: List<String>.from(
                                    products[index]["images"],), type: 1,move: "notmove",showIndicator: true,)
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.topRight,
                          child: Consumer<WishlistNotifier>(
                                builder: (context, wishlistNotifier, child) {
                                  final isFavorite = wishlistNotifier.wishlist
                                      .any((item) =>
                                          item.id == products[index]['id'].toString());
                      
                                  return IconButton(
                                    onPressed: () {
                                      final wishlistItem = WishlistItem(
                                        id: products[index]['id'].toString(),
                                        title: products[index]['title'],
                                        thumbnail: products[index]['thumbnail'],
                                        price: products[index]['price'].toDouble(),
                                      );
                      
                                      if (isFavorite) {
                                        wishlistNotifier.removeFromWishlist(
                                            products[index]['id'].toString());
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                              content: Text(
                                                  '${wishlistItem.title} removed from wishlist')),
                                        );
                                      } else {
                                        wishlistNotifier
                                            .addToWishlist(wishlistItem);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                              content: Text(
                                                  '${wishlistItem.title} added to wishlist')),
                                        );
                                      }
                                    },
                                    icon: Icon(
                                      isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: isFavorite
                                          ? Color.fromRGBO(108, 76, 54, 1.0)
                                          : Color.fromRGBO(108, 76, 54, 1.0),
                                    ),
                                  );
                                },
                              ),
                          // IconButton(
                          //   style: ElevatedButton.styleFrom(
                          //     side: const BorderSide(color: Colors.black),
                          //     padding: const EdgeInsets.all(0),
                          //   ),
                          //   splashColor: const Color.fromRGBO(108, 76, 54, 1),
                          //   onPressed: () {},
                          //   icon: const Icon(
                          //     Icons.favorite_outline_sharp,
                          //     size: 20,
                          //   ),
                          // ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        shape: const ContinuousRectangleBorder(),
                        backgroundColor: Colors.white,
                        elevation: 0,
                      ),
                      onPressed: () {
                        print(products);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => (ProductScreen(
                              id: products[index]["id"],
                              products_list: products,
                            )),
                          ),
                          
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  design.toSentenceCase(
                                      products[index]["category"]),
                                  style: TextStyle(color: Colors.black38),
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width - 100,
                                  child: Text(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    products[index]["title"],
                                    style: GoogleFonts.playfairDisplay(
                                      textStyle: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(108, 76, 54, 1),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  "₹ " +
                                      "${design.toInr(products[index]["price"])}",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 20,
                                ),
                                Text(
                                  "${products[index]["rating"]}",
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              );
            },
          );
        } else {
          return const Center(
            child: Text("Error! Not Found"),
          );
        }
      },
    );
  }
}
