import 'package:flutter/material.dart';
import 'package:g_p_app/core/colors/colors.dart';


class RatingWidget extends StatelessWidget {
  final double rating;

  RatingWidget({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
            (index) => Icon(
          index < rating.floor() ? Icons.star : Icons.star_border,
          color: CustomColors.yellow,
          size: 30.0, // Adjust the size as needed
        ),
      ),
    );
  }
}
