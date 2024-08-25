
import 'package:final_project/Models/CartItem.dart';
import 'package:final_project/Models/Categories.dart';
import 'package:final_project/Models/wishlist_item.dart';
import 'package:final_project/Provider/cartNotifier.dart';
import 'package:final_project/Provider/wishlistNotifier.dart';
import 'package:final_project/formatting.dart';
import 'package:final_project/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import '../Shared/TextBox.dart';
import '../Models/SwipingList.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> _products = [];
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    final response = await Dio().get('https://dummyjson.com/products?limit=500');
    if (response.statusCode == 200) {
      setState(() {
        _products = response.data['products'];
      });
    } else {
      throw Exception('Failed to load products');
    }
  }

  void _startListening() async {
    bool available = await _speech.initialize();
    if (available) {
      setState(() => _isListening = true);
      _speech.listen(
        onResult: (result) {
          setState(() {
            _searchQuery = result.recognizedWords;
            _searchController.text = _searchQuery;
          });
        },
        listenFor: Duration(seconds: 30),
        pauseFor: Duration(seconds: 5),
        partialResults: true,
        onSoundLevelChange: (level) => print("Sound level: $level"),
        localeId: "en_US",
        cancelOnError: true,
        listenMode: stt.ListenMode.dictation,
      );
    }
  }

  void _stopListening() async {
    await _speech.stop();
    setState(() => _isListening = false);
  }

  @override
  Widget build(BuildContext context) {

    Formatting design = Formatting();
    // Filtered products based on search query
    final filteredProducts = _products.where((product) {
      final title = product['title'].toLowerCase();
      return _searchQuery.isEmpty || title.contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.04,
                left: MediaQuery.of(context).size.width * 0.04,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextBox(
                      Icons.search,
                      "Search",
                      false,
                      controller: _searchController,
                      onChanged: (text) {
                        setState(() {
                          _searchQuery = text;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(108, 76, 54, 1.0),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      onPressed: _isListening ? _stopListening : _startListening,
                      icon: Icon(
                        _isListening ? Icons.stop : Icons.mic,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SwipingList(),
            CategorySection(),
            Column(
              children: [
                Text(
                  'Products',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(108, 76, 54, 1.0),
                  ),
                ),
                GridView.builder(
                  padding: EdgeInsets.all(8.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 items per row
                    crossAxisSpacing: 8.0, // Space between columns
                    mainAxisSpacing: 8.0,  // Space between rows
                    childAspectRatio: 0.75, // Aspect ratio of the grid item
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    final product = filteredProducts[index];
                    return Card(
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductScreen(
                                    id: product['id'],
                                    products_list: _products,
                                  ),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Image.network(
                                  product['thumbnail'],
                                  fit: BoxFit.contain,
                                  width: double.infinity,
                                  height: 150,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        product['title'],
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.playfairDisplay(fontSize: 12, color: Colors.black),
                                      ),
                                      Text(
                                        '₹ ${design.toInr(product['price'])}',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.playfairDisplay(fontSize: 12, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                              right: 3,
                              top: 3,
                              child: Consumer<WishlistNotifier>(
                                builder: (context, wishlistNotifier, child) {
                                  final isFavorite = wishlistNotifier.wishlist
                                      .any((item) =>
                                          item.id == product['id'].toString());
                      
                                  return IconButton(
                                    onPressed: () {
                                      final wishlistItem = WishlistItem(
                                        id: product['id'].toString(),
                                        title: product['title'],
                                        thumbnail: product['thumbnail'],
                                        price: product['price'].toDouble(),
                                      );
                      
                                      if (isFavorite) {
                                        wishlistNotifier.removeFromWishlist(
                                            product['id'].toString());
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
                            ),

                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}






