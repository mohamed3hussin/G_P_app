import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/colors/colors.dart';
import '../../../../core/text_style/styles.dart';
import '../../logic/dashBoardCubit/dashboard_cubit.dart';
import '../widget/delete_product_alert.dart';
import '../products/edit_product_screen/edit_item.dart';


class DashBoardProductItem extends StatelessWidget {
  final dynamic product;
  final DashboardCubit cubit;

  const DashBoardProductItem({super.key,
    required this.product,
    required this.cubit,
  });

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
          _buildIndexText(),
          SizedBox(width: 6.w),
          _buildProductImage(),
          Expanded(
            child: Column(
              children: [
                _buildProductInfoRow(context),
                SizedBox(height: 8.h),
                _buildProductSizeAndColorRow(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Method to build the index text
  Widget _buildIndexText() {
    return Text(
      '${product.index + 1}',
      style: Styles.textStyle14,
    );
  }

  // Method to build the product image
  Widget _buildProductImage() {
    return Container(
      width: 42,
      height: 42,
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: NetworkImage(product.productPictures?[0] ?? ''),
          fit: BoxFit.cover,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  // Method to build the product info row
  Widget _buildProductInfoRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 6.w),
        _buildProductName(),
        SizedBox(width: 12.w),
        _buildProductPrice(),
        SizedBox(width: 12.w),
        _buildProductGender(),
        SizedBox(width: 18.w),
        _buildActionButtons(context),
      ],
    );
  }

  // Method to build the product name
  Widget _buildProductName() {
    return SizedBox(
      width: 60.w,
      child: Text(
        product.name ?? '',
        overflow: TextOverflow.ellipsis,
        style: Styles.textStyle14.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Method to build the product price
  Widget _buildProductPrice() {
    return Text(
      product.price?.toString() ?? '',
      style: Styles.textStyle14.copyWith(color: Colors.green),
    );
  }

  // Method to build the product gender type
  Widget _buildProductGender() {
    return Text(
      product.genderType ?? '',
      style: Styles.textStyle14.copyWith(color: Colors.red),
    );
  }

  // Method to build the edit and delete buttons
  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        _buildEditButton(context),
        SizedBox(width: 6.w),
        _buildDeleteButton(context),
      ],
    );
  }

  // Method to build the edit button
  Widget _buildEditButton(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditItem(
            product.name.toString(),
            product.price.toString(),
            product.typeId.toString(),
            product.quantity.toString(),
            product.productSize![0].sizeId!,
            product.productStatus.toString(),
            product.genderType.toString(),
            product.description.toString(),
            product.productColor![0].colorId!,
            'false',
            product.productPictures![0].toString(),
            product.id!,
          ),
        ),
      ),
      child: _buildIconContainer(Icons.edit, const Color(0xFFF8B84E)),
    );
  }

  // Method to build the delete button
  Widget _buildDeleteButton(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => Dialog(
            child: DeleteProductAlert(
              'Want to delete this product?',
              'You will delete this item if you click the delete button',
              product.id.toString(),
            ),
          ),
        );
      },
      child: _buildIconContainer(Icons.delete_forever_outlined, CustomColors.red),
    );
  }

  // Method to build the common icon container for edit/delete buttons
  Widget _buildIconContainer(IconData icon, Color color) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        color: const Color(0xFFFCFCFC),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 6.60,
            offset: Offset(2, 4),
            spreadRadius: 0,
          )
        ],
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Icon(
        icon,
        color: color,
        size: 21,
      ),
    );
  }

  // Method to build the product size and color row
  Widget _buildProductSizeAndColorRow() {
    return Row(
      children: [
        SizedBox(width: 8.w),
        Text('designable', style: Styles.textStyle12),
        SizedBox(width: 15.w),
        Text(
          'Size: ${product.productSize?[0].sizename ?? ''}',
          style: Styles.textStyle12,
        ),
        SizedBox(width: 15.w),
        Text(
          'Color: ${product.productColor?[0].colorname ?? ''}',
          style: Styles.textStyle12,
        ),
      ],
    );
  }
}
