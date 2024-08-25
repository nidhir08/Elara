
import 'package:final_project/screens/profile.dart';
import 'package:final_project/screens/signIn_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:google_fonts/google_fonts.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  @override
  Widget build(BuildContext context) {
    double heightContainer = MediaQuery.sizeOf(context).height / 1.8;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              "assets/images/bottom_left.png",
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            child: Image.asset(
              "assets/images/top_right.png",
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 1.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width / 2.3,
                          height: MediaQuery.sizeOf(context).height / 1.8,
                          child: ImageSlideshow(
                              indicatorBackgroundColor: Colors.transparent,
                              indicatorColor: Colors.transparent,
                              isLoop: true,
                              autoPlayInterval: 2000,
                              children: [
                                Image.asset(
                                  "assets/images/men_model_overview.jpg",
                                ),
                                Image.asset(
                                  "assets/images/motorbike_overview.jpg",
                                ),
                                Image.asset(
                                  "assets/images/furniture_overview.jpg",
                                ),
                              ]),
                        ),
                      ),
                      Container(
                        height: heightContainer,
                        alignment: Alignment.bottomLeft,
                        //color: Colors.pink,
                        child: const Icon(
                          Icons.bubble_chart_rounded,
                          size: 60,
                          //color: Colors.black,
                          color: Color.fromRGBO(108, 76, 54, 1),
                        ),
                      )
                    ]),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width / 2.3,
                            height: heightContainer - 200,
                            child: ImageSlideshow(
                                indicatorBackgroundColor: Colors.transparent,
                                indicatorColor: Colors.transparent,
                                isLoop: true,
                                autoPlayInterval: 2000,
                                children: [
                                  Image.asset(
                                    "assets/images/jwellery_overview.jpg",
                                  ),
                                  Image.asset(
                                    "assets/images/woman_model_overview.jpg",
                                  ),
                                  Image.asset(
                                    "assets/images/glasses_overview.jpg",
                                  ),
                                ]),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width / 2.3,
                            height: 180,
                            child: ImageSlideshow(
                              indicatorBackgroundColor: Colors.transparent,
                              indicatorColor: Colors.transparent,
                              isLoop: true,
                              autoPlayInterval: 2000,
                              children: [
                                Image.asset(
                                  "assets/images/sneakers_overview.jpg",
                                ),
                                Image.asset(
                                  "assets/images/earphones_overview.jpg",
                                ),
                                Image.asset(
                                  "assets/images/kitchen_overview.jpg",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width - 60,
                //decoration: BoxDecoration(color: Colors.green),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: GoogleFonts.playfairDisplay(
                            textStyle: const TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                            ),
                          ),
                          children: const [
                            TextSpan(text: "From Tech to Luxury,\n"),
                            TextSpan(
                              text: 'Elara',
                              style: TextStyle(
                                color: Color.fromRGBO(108, 76, 54, 1),
                              ),
                            ),
                            TextSpan(text: ' Has It All'),
                          ]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Whether you're hunting for the latest tech gadgets, refreshing your wardrobe, or treating yourself to premium goods, Elara is your trusted companion for convenient and delightful online shopping.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.black38),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size.fromWidth(
                            MediaQuery.sizeOf(context).width - 60),
                        backgroundColor: const Color.fromRGBO(108, 76, 54, 1),
                      ),
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));},
                      child: const Text(
                        "Create an Account",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    Row(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an Account?"),
                        TextButton(
                          onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>signIn_Screen())),
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(0)),
                          child: const Text(
                            "Sign in",
                            style: TextStyle(
                              color: Color.fromRGBO(108, 76, 54, 1),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
