import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/colors/colors.dart';
import '../../../core/text_style/styles.dart';

class ProductCounter extends StatefulWidget {
  final Function(int) onCounterChanged;

  ProductCounter(this.onCounterChanged);

  @override
  _ProductCounterState createState() => _ProductCounterState();
}

class _ProductCounterState extends State<ProductCounter> {
  int counter = 1; // Initial counter value

  void incrementCounter() {
    setState(() {
      counter++;
      widget.onCounterChanged(counter);
    });
  }

  void decrementCounter() {
    if (counter > 1) {
      setState(() {
        counter--;
        widget.onCounterChanged(counter);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 180.w,
        height: 50.h,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black,width: 0.8),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: decrementCounter,
              child: Container(
                margin: EdgeInsets.all(8.r),
                width: 24,
                height: 24,
                decoration: ShapeDecoration(
                  color: Color(0xFFD3E4FF),
                  shape: OvalBorder(),
                ),
                child: Icon(
                  Icons.remove,
                  color: CustomColors.darkGrey,
                ),
              ),
            ),
            Container(
              height: 50.h,
              width: 85.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: Colors.black, width: 0.6),
              ),
              child: Center(
                child: Text(counter.toString(), style: Styles.textStyle16),
              ),
            ),
            GestureDetector(
              onTap: incrementCounter,
              child: Container(
                margin: EdgeInsets.all(8.r),
                width: 24,
                height: 24,
                decoration: ShapeDecoration(
                  color: Color(0xFF1B72C0),
                  shape: OvalBorder(),
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
