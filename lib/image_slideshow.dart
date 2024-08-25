import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';

class ImageSlideshower extends StatelessWidget {
  const ImageSlideshower({super.key, required this.images, required this.type,required this.move,required this.showIndicator});
  final List<String> images;
  final int type;
  final String move;
  final bool showIndicator;
  @override
  Widget build(BuildContext context) {
    if (type == 1) {
      return FanCarouselImageSlider.sliderType1(
        
        sliderWidth: MediaQuery.sizeOf(context).width,
        sliderHeight: 300,
        imageFitMode: BoxFit.contain,
        autoPlay: (move == "move")?true:false,
        initalPageIndex: 0,
        indicatorActiveColor: Color.fromRGBO(108, 76, 54, 1),
        currentItemShadow: const [
          BoxShadow(
              offset: Offset(-1, -1), color: Colors.white, blurRadius: 1000),
          BoxShadow(offset: Offset(1, 1), color: Colors.white, blurRadius: 1000)
        ],
        showIndicator: showIndicator,
        imagesLink: images,
        isAssets: false,
        isClickable: false,
      );
    } else {
      return FanCarouselImageSlider.sliderType2(
        sliderHeight: 400,
        initalPageIndex: 0,
        indicatorActiveColor: Color.fromRGBO(108, 76, 54, 1),
        imagesLink: images,
        isAssets: false,
        currentItemShadow: const [
          BoxShadow(
              offset: Offset(-1, -1), color: Colors.white, blurRadius: 1000),
          BoxShadow(offset: Offset(1, 1), color: Colors.white, blurRadius: 1000)
        ],
      );
    }
  }
}
