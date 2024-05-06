import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/assets_data/iconBroken.dart';
import '../../../../../../core/colors/colors.dart';
import '../../../../../../core/text_style/styles.dart';
import '../../../../../../data/model/response/CartResponse.dart';
import '../../../home_cubit/home_cubit.dart';

class CartItemWidget extends StatefulWidget {
  final CartItems model;

  const CartItemWidget(this.model);

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);

    return Row(
      children: [
        Expanded(
          child: Material(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 1.0,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Row(
                  children: [
                    Image(
                      image: NetworkImage(widget.model.pictureUrl ?? ''),
                      width: 80.w,
                      height: 80.h,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.model.productName ?? '',
                            style: Styles.textStyle14.copyWith(
                              color: CustomColors.textColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            'Size : ${widget.model.size}',
                            style: Styles.textStyle14,
                          ),
                          Row(
                            children: [
                              Text(
                                '\$ ${widget.model.price?.toStringAsFixed(2)}',
                                style: Styles.textStyle16.copyWith(
                                  color: CustomColors.green,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  setState(() {
                                    if(widget.model.quantity!=1)
                                    {
                                      widget.model.quantity=(widget.model.quantity!-1);
                                    }
                                  });
                                },
                                icon: CircleAvatar(
                                  radius: 14.r,
                                  backgroundColor: CustomColors.lightBlue,
                                  child: Icon(
                                    Icons.remove,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Text(
                                  '${widget.model.quantity}',
                                  style: Styles.textStyle16.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  setState(() {
                                    widget.model.quantity=(widget.model.quantity!+1);
                                  });
                                },
                                icon: CircleAvatar(
                                  radius: 14.r,
                                  backgroundColor: CustomColors.blue,
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            cubit.deleteCartItem(widget.model);
          },
          icon: Icon(
            IconBroken.Delete,
            color: CustomColors.red,
          ),
        )
      ],
    );
  }
}
