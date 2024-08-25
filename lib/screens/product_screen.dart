
import 'package:final_project/Models/CartItem.dart';
import 'package:final_project/Provider/cartNotifier.dart';
import 'package:final_project/data_print.dart/avatar.dart';
import 'package:final_project/data_print.dart/review_stars.dart';
import 'package:final_project/data_print.dart/tags_data.dart';
import 'package:final_project/formatting.dart';
import 'package:final_project/image_slideshow.dart';
import 'package:final_project/screens/Cart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen(
      {super.key, required this.id, required this.products_list});
  final int id;
  final List products_list;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Map<String, dynamic> dict = {};
  Formatting design = Formatting();
  @override
  Widget build(BuildContext context) {
    int length = widget.products_list.length;
    for (int i = 0; i < length; i++) {
      if (widget.products_list[i]["id"] == widget.id) {
        dict = widget.products_list[i];
        break;
      }
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              //color: Colors.yellow,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black38),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Color.fromRGBO(108, 76, 54, 1),
                size: 25,
              ),
            ),
          ),
        ),
        title: Text(
          "Product Details",
          style: GoogleFonts.playfairDisplay(
            fontSize: 25,
            color: const Color.fromRGBO(108, 76, 54, 1),
          ),
        ),
        centerTitle: true,
        shadowColor: Color.fromRGBO(108, 76, 54, 1),
        elevation: 5,
        actions: [
          Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.04),
            child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),));
              },
              icon: Icon(Icons.shopping_bag_rounded),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ImageSlideshower(
                    images: List<String>.from(dict["images"]), type: 2,move: "move",showIndicator: true,),
                SizedBox(
                  height: 10,
                ),
                Container(
                  //color: Colors.blue,
                  //height: MediaQuery.sizeOf(context).width-100,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            design.toSentenceCase(dict["category"]),
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: 17,
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 25,
                                ),
                                Text(
                                  "${dict["rating"]}",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 17),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width - 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              maxLines: 7,
                              overflow: TextOverflow.ellipsis,
                              dict["title"],
                              style: GoogleFonts.playfairDisplay(
                                textStyle: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(108, 76, 54, 1),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Product Details",
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 17, color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              maxLines: 3,
                              overflow: TextOverflow.fade,
                              dict["description"],
                              style: TextStyle(color: Colors.black38),
                            ),
                            TagsData(tags: dict["tags"]),
                            Divider(
                              height: 30,
                              indent: 0,
                              endIndent: 0,
                              color: Color.fromRGBO(108, 76, 54, 1),
                            ),
                            Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Avability",
                                              style: design.textStyle("main")),
                                          Text(design.Avability(dict["stock"]),
                                              style:
                                                  design.textStyle("notmain"))
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Brand",
                                              style: design.textStyle("main")),
                                          Text(
                                              design.toSentenceCase(
                                                  dict["brand"]),
                                              style:
                                                  design.textStyle("notmain"))
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Stock",
                                              style: design.textStyle("main")),
                                          Text("${dict["stock"]}",
                                              style:
                                                  design.textStyle("notmain"))
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Warranty",
                                              style: design.textStyle("main")),
                                          Text(
                                              design.toSentenceCase(
                                                  dict["warrantyInformation"]),
                                              style:
                                                  design.textStyle("notmain"))
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Shipping",
                                              style: design.textStyle("main")),
                                          Text(
                                              design.toSentenceCase(
                                                  dict["shippingInformation"]),
                                              style:
                                                  design.textStyle("notmain"))
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Return Policy",
                                              style: design.textStyle("main")),
                                          Text(
                                              design.toSentenceCase(
                                                  dict["returnPolicy"]),
                                              style:
                                                  design.textStyle("notmain"))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  //color: Colors.yellow,
                                  alignment: Alignment.topRight,
                                  child: Image.network(
                                    dict["meta"]["qrCode"],
                                    height: 150,
                                  ),
                                )
                              ],
                            ),
                            Divider(
                              height: 30,
                              indent: 0,
                              endIndent: 0,
                              color: Color.fromRGBO(108, 76, 54, 1),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Center(
                                    child: Text(
                                      "Reviews",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(108, 76, 54, 1),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 50,
                                        alignment: Alignment.bottomCenter,
                                        //color: Colors.yellow,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "${dict["rating"]}",
                                              style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                    fontSize: 40,
                                                    color: Color.fromRGBO(
                                                        108, 76, 54, 1),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Text(
                                              "OUT OF 5",
                                              style: TextStyle(
                                                  color: Colors.black38,
                                                  fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ),
                                      ReviewStars(rating: dict["rating"], type: "main")
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      
                                      Text(
                                        "${dict["reviews"].length}" +
                                            " Reviews",
                                        style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 15),
                                      ),
                                      ElevatedButton.icon(
                                        iconAlignment: IconAlignment.end,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          elevation: 0,
                                        ),
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.edit_outlined,
                                          color: Colors.black38,
                                        ),
                                        label: Text(
                                          "WRITE A REVIEW",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black38),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    height: 400,
                                    child: ListView.builder(
                                      itemCount: dict["reviews"].length,
                                      itemBuilder: (context, index) {
                                        Map<String, dynamic> temp =
                                            dict["reviews"][index];
                                        print(temp);
                                        return Card(
                                          elevation: 5,
                                            color: Colors.white,
                                            child: Container(
                                              padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Avatar(
                                                      name: temp["reviewerName"]),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Text(temp["reviewerName"],
                                                          style: GoogleFonts
                                                              .playfairDisplay(
                                                            textStyle: TextStyle(
                                                              fontSize: 20,
                                                              color: Colors.black,
                                                            ),
                                                          )),
                                                      Row(
                                                        children: [
                                                          ReviewStars(rating: (temp["rating"]).toDouble(), type: "notmain"),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            "${temp["rating"]}" +
                                                                " OUT OF 5, " +
                                                                "${design.convertTime(temp["date"])}",
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                color: Colors
                                                                    .black38),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(height: 10,),
                                                      Text("${temp["comment"]}",style: TextStyle(fontSize: 15,color: Colors.black),)
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ));
                                      },
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Total Price",
                    style: TextStyle(fontSize: 15, color: Colors.black38),
                  ),
                  Text(
                    "₹ " + "${design.toInr(dict["price"])}",
                    style: const TextStyle(
                      fontSize: 25,
                      color: Color.fromRGBO(108, 76, 54, 1),
                    ),
                  )
                ],
              ),
              const VerticalDivider(
                indent: 5,
                endIndent: 5,
                color: Colors.black,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(108, 76, 54, 1),
                  elevation: 5,
                  shadowColor: Colors.black,
                ),
                onPressed: () {
                  final _cartNotifier =
                      Provider.of<Cartnotifier>(context, listen: false);
                  final cartItem = CartItem(
                    id: dict['id'].toString(),
                    title: dict['title'],
                    price: dict['price'].toDouble(),
                    thumbnail: dict['thumbnail'],
                  );
                  _cartNotifier.addToCart(cartItem);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${cartItem.title} added to cart')),
                  );
                },
                child: Text("Add to Cart",
                    style: GoogleFonts.playfairDisplay(
                        textStyle: const TextStyle(
                            fontSize: 25, color: Colors.white))),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
