import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/data/model/response/AllProductResponse.dart';
import 'package:g_p_app/features/dashboard/ui/products/widgets/product_dashboard_action_widget.dart';

import '../../../../../core/text_style/styles.dart';

class ProductInfoRow extends StatelessWidget {
  final Data product;
  final Function onEdit;
  final Function onDelete;

  const ProductInfoRow({
    Key? key,
    required this.product,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 6.w),
        Text(
          product.name??'',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Styles.textStyle14.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 12.w),
        Text(
          product.price.toString(),
          style: Styles.textStyle14.copyWith(color: Colors.green),
        ),
        SizedBox(width: 12.w),
        Text(
          product.genderType??'',
          style: Styles.textStyle14.copyWith(color: Colors.red),
        ),
        SizedBox(width: 18.w),
        ProductActions(onEdit: onEdit, onDelete: onDelete),
      ],
    );
  }
}
