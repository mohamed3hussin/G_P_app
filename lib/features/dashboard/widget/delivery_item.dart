import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/dashboard/widget/delete_alert.dart';

import 'edit_delivery.dart';

class DeliveryItem extends StatelessWidget {
  const DeliveryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: CustomColors.lightGrey,
      ),
      child: Row(
        children: [
          Text('1', style: Styles.textStyle14,),
          SizedBox(width: 8.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(width: 16.w,),
                  Text('UPS1', style: Styles.textStyle14!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),),
                  SizedBox(width: 16.w,),
                  Text('10.00',
                    style: Styles.textStyle14!.copyWith(color: Colors.green),),
                  SizedBox(width: 140.w,),
                  Row(
                    children: [
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                            color: Color(0xFFFCFCFC),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 6.60,
                                offset: Offset(2, 4),
                                spreadRadius: 0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(50.r)
                        ),
                        child: InkWell(
                          onTap: ()=>Navigator.of(context).pushNamed(EditDelivery.routeName),
                          child: Icon(
                            Icons.edit, color: Color(0xFFF8B84E), size: 21,),
                        ),
                      ),
                      SizedBox(width: 8.w,),
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context)
                          =>
                              Dialog(
                                child: DeleteItemAlert(
                                    'Want To delete this Delivery Method ?',
                                    'You will delete this Method if you click the delete button'),
                                ),
                              );
                        },
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                              color: Color(0xFFFCFCFC),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 6.60,
                                  offset: Offset(2, 4),
                                  spreadRadius: 0,
                                )
                              ],
                              borderRadius: BorderRadius.circular(50.r)
                          ),
                          child: Icon(Icons.delete_forever_outlined,
                            color: CustomColors.red, size: 22,),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8.h,),
              Row(
                children: [
                  SizedBox(width: 16.w,),
                  Text('1-2 days', style: Styles.textStyle12,),
                  SizedBox(width: 15.w,),
                  Text('Fastest Delivery Time', style: Styles.textStyle12),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
