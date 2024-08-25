import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';

class ReviewStars extends StatelessWidget {
  const ReviewStars({super.key,required this.rating,required this.type});
  final double rating;
  final String type;
  @override
  Widget build(BuildContext context) {
    return AnimatedRatingStars(
      initialRating: rating,
      onChanged: (p0) => (),
      customFilledIcon: Icons.star,
      customHalfFilledIcon: Icons.star,
      customEmptyIcon: Icons.star_border,
      readOnly: true,
      
      starSize: (type == "main")?30:13,
    );
  }
}
