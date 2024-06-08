import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/features/dashboard/dashBoardCubit/dash_board_cubit.dart';
import 'package:g_p_app/features/dashboard/dashBoardCubit/dash_board_state.dart';
import 'package:g_p_app/features/dashboard/widget/satus_container.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../../core/assets_data/iconBroken.dart';
import '../../../core/colors/colors.dart';
import '../../../core/shared_widget/custom_button.dart';
import '../../../core/shared_widget/default_text.dart';
import '../../../core/text_style/styles.dart';

class AddProduct extends StatefulWidget {
  static const String routeName = 'add_product';
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();

  String groupValue = '0';
  int? typeIndex;
  String isDesign = 'false';
  String inStoke = '0';
  var descriptionController = TextEditingController();
  var quantityController = TextEditingController();
  var priceController = TextEditingController();
  var nameController = TextEditingController();
  var typeController = TextEditingController();
  bool image = true;
  bool _imagePickedError = false;
  List<bool> isSelected = [true, false, false, false, false];
  List<bool> isSizeSelected = [true, false, false, false, false];
  int colorNumber = 1;
  int sizeNumber = 1;

  File? imagePicked;
  Future pickImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      imagePicked = File(image!.path);
      _imagePickedError = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashBoardCubit, DashBoardState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DashBoardCubit.get(context);
        return Scaffold(
          body: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w, vertical: 30.h),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Add Product',
                          style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600, color: Color(0xFF000000)),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(IconBroken.Close_Square),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Align(
                                child: Text(
                                  'Product name',
                                  style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w400, color: Color(0xFF270008)),
                                ),
                                alignment: AlignmentDirectional.topStart,
                              ),
                              SizedBox(height: 5.h),
                              TextFormField(
                                controller: nameController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: 'ex: dress',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a product name';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Column(
                          children: [
                            Align(
                              child: Text(
                                'Product Quantity',
                                style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w400, color: Color(0xFF270008)),
                              ),
                              alignment: AlignmentDirectional.topStart,
                            ),
                            SizedBox(height: 7.h),
                            Container(
                              width: 90.w,
                              child: TextFormField(
                                controller: quantityController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: '0-99',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a quantity';
                                  }
                                  if (int.tryParse(value) == 0) {
                                    return 'Please enter a valid number';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Align(
                                child: Text(
                                  'Product Type',
                                  style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w400, color: Color(0xFF270008)),
                                ),
                                alignment: AlignmentDirectional.topStart,
                              ),
                              SizedBox(height: 5.h),
                              TextFormField(
                                controller: typeController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'ex: 1,2',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a product type';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Column(
                          children: [
                            Align(
                              child: Text(
                                'Product price',
                                style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w400, color: Color(0xFF270008)),
                              ),
                              alignment: AlignmentDirectional.topStart,
                            ),
                            SizedBox(height: 7.h),
                            Container(
                              width: 90.w,
                              child: TextFormField(
                                controller: priceController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: '0-99',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a price';
                                  }
                                  if (double.tryParse(value) == 0) {
                                    return 'Please enter a valid price';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Align(
                      child: Text(
                        'Product Size',
                        style: Styles.textStyle14.copyWith(color: CustomColors.textColor, fontWeight: FontWeight.w400),
                      ),
                      alignment: AlignmentDirectional.topStart,
                    ),
                    SizedBox(height: 5.h),
                    ToggleButtons(
                      borderRadius: BorderRadius.circular(12.r),
                      borderWidth: 1,
                      borderColor: Colors.black,
                      selectedBorderColor: CustomColors.blue,
                      isSelected: isSizeSelected,
                      onPressed: (index) {
                        setState(() {
                          for (int i = 0; i < isSizeSelected.length; i++) {
                            sizeNumber = index + 1;
                            isSizeSelected[i] = i == index;
                          }
                          print(sizeNumber);
                        });
                      },
                      children: [
                        StatusContainer('XS', false),
                        StatusContainer('S', false),
                        StatusContainer('M', false),
                        StatusContainer('L', false),
                        StatusContainer('XL', false),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Align(
                      child: Text(
                        'Status',
                        style: Styles.textStyle14.copyWith(color: CustomColors.textColor, fontWeight: FontWeight.w400),
                      ),
                      alignment: AlignmentDirectional.topStart,
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Container(
                          height: 30.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: CustomColors.lightGrey),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                activeColor: CustomColors.blue,
                                value: '0',
                                groupValue: inStoke,
                                onChanged: (value) {
                                  setState(() {
                                    inStoke = value!;
                                    print(inStoke);
                                  });
                                },
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.only(end: 3.w),
                                child: Text(
                                  'In stock',
                                  style: Styles.textStyle12.copyWith(fontWeight: FontWeight.w400, color: CustomColors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Container(
                          height: 30.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: CustomColors.lightGrey),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                activeColor: CustomColors.blue,
                                value: '1',
                                groupValue: inStoke,
                                onChanged: (value) {
                                  setState(() {
                                    inStoke = value!;
                                    print(inStoke);
                                  });
                                },
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.only(end: 3.w),
                                child: Text(
                                  'Out of stock',
                                  style: Styles.textStyle12.copyWith(fontWeight: FontWeight.w400, color: CustomColors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Align(
                      child: Text(
                        'Gender',
                        style: Styles.textStyle14.copyWith(
                            color: CustomColors.textColor,
                            fontWeight: FontWeight.w400),
                      ),
                      alignment: AlignmentDirectional.topStart,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 30.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border:
                              Border.all(color: CustomColors.lightGrey)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                  activeColor: CustomColors.blue,
                                  value: '1',
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    //cubit fun her
                                    setState(() {
                                      groupValue = value!;
                                      print(groupValue);
                                    });
                                  }),
                              Padding(
                                padding: EdgeInsetsDirectional.only(end: 3.w),
                                child: Text(
                                  'Male',
                                  style: Styles.textStyle12.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: CustomColors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          height: 30.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border:
                              Border.all(color: CustomColors.lightGrey)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                  activeColor: CustomColors.blue,
                                  value: '0',
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    //cubit fun her
                                    setState(() {
                                      groupValue = value!;
                                      print(groupValue);
                                    });
                                  }),
                              Padding(
                                padding: EdgeInsetsDirectional.only(end: 3.w),
                                child: Text(
                                  'Female',
                                  style: Styles.textStyle12.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: CustomColors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          height: 30.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border:
                              Border.all(color: CustomColors.lightGrey)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                  activeColor: CustomColors.blue,
                                  value: '2',
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    //cubit fun her
                                    setState(() {
                                      groupValue = value!;
                                      print(groupValue);
                                    });
                                  }),
                              Padding(
                                padding: EdgeInsetsDirectional.only(end: 3.w),
                                child: Text(
                                  'Unisex',
                                  style: Styles.textStyle12.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: CustomColors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Align(
                      child: Text(
                        'Description',
                        style: Styles.textStyle14.copyWith(color: CustomColors.textColor, fontWeight: FontWeight.w400),
                      ),
                      alignment: AlignmentDirectional.topStart,
                    ),
                    SizedBox(height: 5.h),
                    TextFormField(
                      controller: descriptionController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Write your description',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15.h),
                    Align(
                      child: Text(
                        'Image',
                        style: Styles.textStyle14.copyWith(color: CustomColors.textColor, fontWeight: FontWeight.w400),
                      ),
                      alignment: AlignmentDirectional.topStart,
                    ),
                    SizedBox(height: 5.h),
                    GestureDetector(
                      onTap: () {
                        pickImageFromGallery();
                      },
                      child: Container(
                        height: 100.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: _imagePickedError ? Colors.red : CustomColors.grey),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: imagePicked != null
                            ? Image.file(imagePicked!)
                            : Center(
                          child: Text(
                            'Pick an image',
                            style: Styles.textStyle14.copyWith(color: CustomColors.grey),
                          ),
                        ),
                      ),
                    ),
                    if (_imagePickedError)
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            'Please pick an image',
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          ),
                        ),
                      ),
                    SizedBox(height: 15.h),
                    Align(
                      child: Text(
                        'Design',
                        style: Styles.textStyle14.copyWith(color: CustomColors.textColor, fontWeight: FontWeight.w400),
                      ),
                      alignment: AlignmentDirectional.topStart,
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Container(
                          height: 30.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: CustomColors.lightGrey),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                activeColor: CustomColors.blue,
                                value: 'true',
                                groupValue: isDesign,
                                onChanged: (value) {
                                  setState(() {
                                    isDesign = value!;
                                    print(isDesign);
                                  });
                                },
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.only(end: 3.w),
                                child: Text(
                                  'true',
                                  style: Styles.textStyle12.copyWith(fontWeight: FontWeight.w400, color: CustomColors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Container(
                          height: 30.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: CustomColors.lightGrey),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                  activeColor: CustomColors.blue,
                                  value: 'false',
                                  groupValue: isDesign,
                                  onChanged: (value)
                                  {
                                    //cubit fun her
                                    setState(() {
                                      isDesign = value!;
                                      print(isDesign);
                                    });

                                  }),
                              Padding(
                                padding: EdgeInsetsDirectional.only(end: 3.w),
                                child: Text(
                                  'false',
                                  style: Styles.textStyle12.copyWith(fontWeight: FontWeight.w400, color: CustomColors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Align(
                      child: Text(
                        'Color',
                        style: Styles.textStyle14.copyWith(color: CustomColors.textColor, fontWeight: FontWeight.w400),
                      ),
                      alignment: AlignmentDirectional.topStart,
                    ),
                    SizedBox(height: 5.h),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ToggleButtons(
                        borderRadius: BorderRadius.circular(12.r),
                        borderWidth: 1,
                        borderColor: Colors.black,
                        selectedBorderColor: CustomColors.blue,
                        isSelected: isSelected,
                        onPressed: (index) {
                          setState(() {
                            for (int i = 0; i < isSelected.length; i++) {
                              colorNumber = index + 1;
                              isSelected[i] = i == index;
                            }
                            print(colorNumber);
                          });
                        },
                        children: [
                          StatusContainer('red', true,background: Colors.red,),
                          StatusContainer('blue', true,background: Colors.blue,),
                          StatusContainer('white', true,background: Colors.white,),
                          StatusContainer('black', true,background: Colors.black,),
                          StatusContainer('yellow', true,background: Colors.yellow,),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    CustomButton(
                      func: () async {
                        if (_formKey.currentState!.validate()) {
                          if (imagePicked == null) {
                            setState(() {
                              _imagePickedError = true;
                            });
                          } else {
                            print('All validations passed');
                            final description = descriptionController.text;
                            final quantity = quantityController.text;
                            final price = priceController.text;
                            final name = nameController.text;
                            final type = typeController.text;
                            final status = inStoke;
                            final design = isDesign;

                            await cubit.postData(
                                {
                                'Name':nameController.text,
                                'Description':descriptionController.text,
                                'Price':priceController.text,
                                'IsDesignable':isDesign,
                                'Quantity':quantityController.text,
                                'TypeId':typeController.text,
                                'ProductColors':'$colorNumber',
                                'ProductSizes':'$sizeNumber',
                                'GenderType':'$groupValue',
                                'ProductStatus':'$inStoke',
                                'ProdcutPictures':await MultipartFile.fromFile(imagePicked!.path,filename: imagePicked!.path.split('/').last,contentType: MediaType("image", "jpeg"),),

                            });
                          }
                          Navigator.pop(context);
                        }
                      },
                      text: 'Add product',
                      backgroundColor: CustomColors.blue,
                      borderRadius: BorderRadius.circular(12.r),
                      style: Styles.textStyle16.copyWith(color: Colors.white),
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
