import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/home_screen/product_details/widgets/size_container.dart';

import '../../../../data/model/response/AllProductResponse.dart';

class SizeLine extends StatefulWidget {
  final void Function(String)? onSizeSelected; // Define callback function

  const SizeLine({Key? key, this.onSizeSelected}) : super(key: key);

  @override
  State<SizeLine> createState() => _SizeLineState();
}

class _SizeLineState extends State<SizeLine> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Data;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Size',
        style: Styles.textStyle16,
      ),
      SizedBox(
        height: 60.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                currentIndex = index;
                setState(() {});
                  widget.onSizeSelected!(args.productSize?[index].sizename ?? args.productSize![0].sizename!);

              },
              child: SizeContainer(
                args.productSize?[index].sizename ?? '',
                currentIndex == index,
              ),
            );
          },
          itemCount: args.productSize?.length,
        ),
      )
    ]);
  }
}
