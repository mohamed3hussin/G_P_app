import 'package:flutter/material.dart';
import 'package:g_p_app/core/colors/colors.dart';


class RatingWidget extends StatelessWidget {
  final double rating;
  final double? size;
  RatingWidget({required this.rating,this.size=30});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
            (index) => Icon(
          index < rating.floor() ? Icons.star : Icons.star_border,
          color: CustomColors.yellow,
          size: size, // Adjust the size as needed
        ),
      ),
    );
  }
}
