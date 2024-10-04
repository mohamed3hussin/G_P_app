import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/data/model/response/AllProductResponse.dart';
import 'package:g_p_app/features/dashboard/ui/products/widgets/product_dashboard_details_row.dart';
import 'package:g_p_app/features/dashboard/ui/products/widgets/product_dashboard_image_widget.dart';
import 'package:g_p_app/features/dashboard/ui/products/widgets/product_dashboard_info_row.dart';

import '../../../../../core/colors/colors.dart';
import '../../../../../core/text_style/styles.dart';

class ProductItem extends StatelessWidget {
  final int index;
  final Data product;
  final Function onEdit;
  final Function onDelete;

  const ProductItem({
    Key? key,
    required this.index,
    required this.product,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: CustomColors.lightGrey,
      ),
      child: Row(
        children: [
          Text(
            '${index + 1}',
            style: Styles.textStyle14,
          ),
          SizedBox(width: 6.w),
          ProductImage(imageUrl: product.productPictures?[0] ?? ''),
          Expanded(
            child: Column(
              children: [
                ProductInfoRow(
                  product: product,
                  onEdit: onEdit,
                  onDelete: onDelete,
                ),
                SizedBox(height: 8.h),
                ProductDetailsRow(
                  size: product.productSize?[0].sizename ?? '',
                  color: product.productColor?[0].colorname ?? '',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
