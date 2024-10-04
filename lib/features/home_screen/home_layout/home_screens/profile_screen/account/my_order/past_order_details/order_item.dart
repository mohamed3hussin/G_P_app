import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';

class OrderItem extends StatelessWidget {
  String name;
  String price;
  String? productPicture;
  void Function() function;
  OrderItem(this.name, this.price,this.productPicture,this.function, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h,top: 8.h,left: 16.w,right: 16.w),
      child: Container(
        width: 345.w,
        height: 160.h,
        decoration: BoxDecoration(
          color: CustomColors.lightGrey,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(7.r),
              child: productPicture != null
                  ? Container(clipBehavior: Clip.antiAliasWithSaveLayer,
                width: 120,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  image: DecorationImage(image: NetworkImage(
                    productPicture!,

                  ),)
                ),
                  )
                  : const SizedBox(width: 120,child: Icon(Icons.error, size: 30)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: Styles.textStyle16.copyWith(color: Colors.black,fontSize: 18.sp),
                ),
                Text(
                  '\$ $price',
                  style:
                      Styles.textStyle20.copyWith(color: CustomColors.green),
                ),
                SizedBox(height: 15.h,),
                Padding(
                  padding: EdgeInsets.only(left: 90.w, right: 8),
                  child: InkWell(
                    onTap: (){function();},
                    child: Container(
                      width: 100.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: CustomColors.blue),
                          borderRadius: BorderRadius.circular(8.r)
                      ),
                      child: Center(
                        child: Text(
                          'Add Review',
                          style: Styles.textStyle12.copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
