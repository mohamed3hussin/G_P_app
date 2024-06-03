import 'dart:io';
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

  String groupValue ='';
  int ? typeIndex;
  String isDesign ='';
  String inStoke ='';
  var descriptionController = TextEditingController();
  var quantityController = TextEditingController();
  var priceController = TextEditingController();
  var nameController = TextEditingController();
  var typeController = TextEditingController();
  bool image =true;
  List<bool> isSelected = [false, false, false, false,false];
  List<bool> isSizeSelected = [false, false, false, false,false];
  int colorNumber = 1;
  int sizeNumber = 1;

   File? imagePicked ;
  Future pickImageFromGallery()async
  {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      imagePicked = File(image!.path);
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashBoardCubit,DashBoardState>(
      listener: (context,state){},
      builder: (context,state)
      {
        var cubit = DashBoardCubit.get(context);
        return Scaffold(
          body: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w,vertical: 30.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children:
                    [
                      Text(
                        'Add Product',
                        style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600,color: Color(0xFF000000)),),
                      Spacer(),
                      IconButton(onPressed: ()
                      {
                        Navigator.pop(context);
                      }, icon: Icon(IconBroken.Close_Square))
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    children: [
                      Expanded(
                          child:
                          Column(
                            children: [
                              Align(
                                child: Text(
                                  'Product name',
                                  style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w400,color: Color(0xFF270008)),),
                                alignment: AlignmentDirectional.topStart,
                              ),
                              SizedBox(height: 5.h,),
                              defaultTextField(
                                controller: nameController,
                                type: TextInputType.text,
                                border: Colors.grey,
                                hint: 'ex: dress',

                              ),
                            ],
                          )),
                      SizedBox(width: 10.w,),
                      Column(
                        children: [
                          Align(
                            child: Text(
                              'Product Quantity',
                              style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w400,color: Color(0xFF270008)),),
                            alignment: AlignmentDirectional.topStart,
                          ),
                          SizedBox(height: 7.h,),
                          Container(
                            width: 90.w,
                            child: defaultTextField(
                              controller: quantityController,
                              type:TextInputType.number,
                              hint: '0-99',
                              border: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h,),
                  Row(
                    children: [
                      Expanded(
                          child:
                          Column(
                            children: [
                              Align(
                                child: Text(
                                  'Product Type',
                                  style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w400,color: Color(0xFF270008)),),
                                alignment: AlignmentDirectional.topStart,
                              ),
                              SizedBox(height: 5.h,),
                              defaultTextField(
                                controller: typeController,
                                type: TextInputType.text,
                                border: Colors.grey,
                                hint: 'ex: 1,2',

                              ),
                            ],
                          )),
                      SizedBox(width: 10.w,),
                      Column(
                        children: [
                          Align(
                            child: Text(
                              'Product price',
                              style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w400,color: Color(0xFF270008)),),
                            alignment: AlignmentDirectional.topStart,
                          ),
                          SizedBox(height: 7.h,),
                          Container(
                              width: 90.w,
                              child: defaultTextField(
                                controller: priceController,
                                type:TextInputType.number,
                                hint: '0-99',
                                border: Colors.grey, )
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h,),
                  Align(
                    child: Text(
                      'Product Size',
                      style: Styles.textStyle14.copyWith(color: CustomColors.textColor,fontWeight: FontWeight.w400),
                    ),
                    alignment: AlignmentDirectional.topStart,
                  ),
                  SizedBox(height: 5.h,),
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
                      StatusContainer('XS',false),
                      StatusContainer('S',false),
                      StatusContainer('L',false),
                      StatusContainer('M',false),
                      StatusContainer('XL',false),
                    ],
                  ),
                  SizedBox(height: 15.h,),
                  Align(
                    child: Text(
                      'status',
                      style: Styles.textStyle14.copyWith(color: CustomColors.textColor,fontWeight: FontWeight.w400),
                    ),
                    alignment: AlignmentDirectional.topStart,
                  ),
                  SizedBox(height: 5.h,),
                  Row(
                    children: [
                      Container(
                        height: 30.h,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: CustomColors.lightGrey)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:
                          [
                            Radio(
                                activeColor: CustomColors.blue,
                                value: '0',
                                groupValue: inStoke,
                                onChanged: (value)
                                {
                                  //cubit fun her
                                  setState(() {
                                    inStoke = value!;
                                    print(inStoke);
                                  });

                                }),

                            Padding(
                              padding: EdgeInsetsDirectional.only(end: 3.w),
                              child: Text('in stock',style: Styles.textStyle12.copyWith(fontWeight: FontWeight.w400,color: CustomColors.grey),),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 5.w,),
                      Container(
                        height: 30.h,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: CustomColors.lightGrey)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:
                          [
                            Radio(activeColor: CustomColors.blue,value: '1', groupValue: inStoke, onChanged: (value)
                            {
                              //cubit fun her
                              setState(() {
                                inStoke = value!;
                                print(inStoke);
                              });

                            }),

                            Padding(
                              padding: EdgeInsetsDirectional.only(end: 3.w),
                              child: Text('Out of stock',style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w400,color: CustomColors.grey),),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h,),
                  Align(
                    child: Text(
                      'Gender',
                      style: Styles.textStyle14.copyWith(color: CustomColors.textColor,fontWeight: FontWeight.w400),
                    ),
                    alignment: AlignmentDirectional.topStart,
                  ),
                  SizedBox(height: 5.h,),
                  Row(
                    children:
                    [
                      Container(
                        height: 30.h,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: CustomColors.lightGrey)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:
                          [
                            Radio(
                                activeColor: CustomColors.blue,
                                value: '1',
                                groupValue: groupValue,
                                onChanged: (value)
                                {
                                  //cubit fun her
                                  setState(() {
                                    groupValue = value!;
                                    print(groupValue);
                                  });

                                }),

                            Padding(
                              padding: EdgeInsetsDirectional.only(end: 3.w),
                              child: Text('Male',style: Styles.textStyle12.copyWith(fontWeight: FontWeight.w400,color: CustomColors.grey),),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 5.w,),
                      Container(
                        height: 30.h,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: CustomColors.lightGrey)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:
                          [
                            Radio(activeColor: CustomColors.blue,value: '0', groupValue: groupValue, onChanged: (value)
                            {
                              //cubit fun her
                              setState(() {
                                groupValue = value!;
                                print(groupValue);
                              });

                            }),

                            Padding(
                              padding: EdgeInsetsDirectional.only(end: 3.w),
                              child: Text('Female',style: Styles.textStyle12.copyWith(fontWeight: FontWeight.w400,color: CustomColors.grey),),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 5.w,),
                      Container(
                        height: 30.h,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: CustomColors.lightGrey)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:
                          [
                            Radio(activeColor: CustomColors.blue,value: '2', groupValue: groupValue, onChanged: (value)
                            {
                              //cubit fun her
                              setState(() {
                                groupValue = value!;
                                print(groupValue);
                              });

                            }),

                            Padding(
                              padding: EdgeInsetsDirectional.only(end: 3.w),
                              child: Text('Unisex',style: Styles.textStyle12.copyWith(fontWeight: FontWeight.w400,color: CustomColors.grey),),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h,),
                  Align(
                    child: Text(
                      'Description',
                      style: Styles.textStyle14.copyWith(color: CustomColors.textColor,fontWeight: FontWeight.w400),
                    ),
                    alignment: AlignmentDirectional.topStart,
                  ),
                  SizedBox(height: 5.h,),
                  Container(
                    height: 100.h,
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(
                        border: Border.all(color: CustomColors.lightGrey),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: TextFormField(
                      controller:descriptionController,
                      decoration: InputDecoration(
                        hintText: '445434',
                        hintStyle: Styles.textStyle14.copyWith(color: CustomColors.grey,fontWeight: FontWeight.w400),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  Align(
                    child: Text(
                      'Color',
                      style: Styles.textStyle14.copyWith(color: CustomColors.textColor,fontWeight: FontWeight.w400),
                    ),
                    alignment: AlignmentDirectional.topStart,
                  ),
                  SizedBox(height: 5.h,),
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
                        StatusContainer('Red',true, background: Colors.red),
                        StatusContainer('Blue',true, background: Colors.blue),
                        StatusContainer('Black',true, background: Colors.black),
                        StatusContainer('White',true, background: Colors.white),
                        StatusContainer('Green',true, background: Colors.green),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  Align(
                    child: Text(
                      'Is Designable',
                      style: Styles.textStyle14.copyWith(color: CustomColors.textColor,fontWeight: FontWeight.w400),
                    ),
                    alignment: AlignmentDirectional.topStart,
                  ),
                  SizedBox(height: 5.h,),
                  Row(
                    children:
                    [
                      Container(
                        height: 30.h,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: CustomColors.lightGrey)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:
                          [
                            Radio(
                                activeColor: CustomColors.blue,
                                value: 'true',
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
                              child: Text('True',style: Styles.textStyle12.copyWith(fontWeight: FontWeight.w400,color: CustomColors.grey),),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 5.w,),
                      Container(
                        height: 30.h,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: CustomColors.lightGrey)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:
                          [
                            Radio(activeColor: CustomColors.blue,value: 'false', groupValue: isDesign, onChanged: (value)
                            {
                              //cubit fun her
                              setState(() {
                                isDesign = value!;
                              });

                            }),

                            Padding(
                              padding: EdgeInsetsDirectional.only(end: 3.w),
                              child: Text('False',style: Styles.textStyle12.copyWith(fontWeight: FontWeight.w400,color: CustomColors.grey),),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 20.h,),
                  Row(

                    mainAxisAlignment: imagePicked != null?MainAxisAlignment.start : MainAxisAlignment.center,
                    children: [
                      if(imagePicked != null)
                        Container(
                          height: 90.h,
                          width: 90.w,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.black)
                          ),
                          child:  Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              if(imagePicked != null)
                                Image.file(imagePicked!),

                            ],
                          ),
                        ),
                      if(imagePicked != null)
                        SizedBox(width: 10.w,),
                      CustomButton(
                          icon: IconBroken.Upload,
                          iconColor: Colors.white,
                          radius: 12,
                          width: 195.w,
                          height: 50.h,
                          backgroundColor: CustomColors.blue,
                          text: 'Upload a photo',
                          func: ()
                          {
                            pickImageFromGallery();
                          },
                          style: Styles.textStyle16.copyWith(color: Colors.white)
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  CustomButton(
                      icon: IconBroken.Plus,
                      iconColor: Colors.white,
                      radius: 12,
                      width: 195.w,
                      height: 50.h,
                      backgroundColor: CustomColors.blue,
                      text: 'Add Product',
                      func: ()
                      async {
                          cubit.postData(
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
                      },
                      style: Styles.textStyle16.copyWith(color: Colors.white)
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
