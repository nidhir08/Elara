
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class SwipingList extends StatefulWidget {
  const SwipingList({super.key});

  @override
  State<SwipingList> createState() => _SwipingListState();
}

class _SwipingListState extends State<SwipingList> {
  List<String> images = [
    'assets/images/newArrival_home.png',
    'assets/images/sale_home.jpeg',
    'assets/images/makeup_home.jpeg'
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
      child: Container(
          height: MediaQuery.of(context).size.height * 0.3,
          child: ImageSlideshow(
            autoPlayInterval: 2000,
            isLoop: true,
            indicatorColor: Color.fromRGBO(108, 76, 54, 1),
            children: [
              Image.asset(
                "assets/images/newArrival_home.png",
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width * 0.9,
              ),
              Image.asset(
                "assets/images/makeup_home.jpeg",
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width * 0.9,
              ),
              Image.asset(
                "assets/images/sale_home.jpeg",
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width * 0.9,
              ),
            ],
          )),
    );
  }
}
