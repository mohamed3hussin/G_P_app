import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/product_details/widgets/color_container.dart';

import '../../../data/model/response/AllProductResponse.dart';

class ColorLine extends StatefulWidget {
  @override
  State<ColorLine> createState() => _ColorLineState();
}

class _ColorLineState extends State<ColorLine> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Data;
    List<Color>? colors = args.productColor?.map((colorMap) {
      String colorName = colorMap.colorname!;
      return getColorFromName(colorName);
    }).toList();
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Color',
        style: Styles.textStyle16,
      ),
      Container(
        height: 60.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ColorContainer(
              color: colors![index],
              isSelected: currentIndex == index,
              onTap: () {
                currentIndex = index;
                setState(() {});
              },
            );
          },
          itemCount: args.productColor?.length,
        ),
      )
    ]);
  }
}

Color getColorFromName(String colorData) {
  switch (colorData.toLowerCase()) {
    case 'green':
      return Colors.green;
    case 'black':
      return Colors.black;
    case 'red':
      return Colors.red;
    case 'blue':
      return Colors.blue;
    default:
      return Colors.white;
  }
}
