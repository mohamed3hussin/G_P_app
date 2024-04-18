import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/core/assets_data/iconBroken.dart';
import 'package:g_p_app/core/shared_widget/custom_button.dart';
import 'package:g_p_app/features/dashboard/widget/satus_container.dart';

import '../../../core/colors/colors.dart';
import '../../../core/shared_widget/default_text.dart';
import '../../../core/text_style/styles.dart';
import '../../product_details/widgets/size_container.dart';

class EditItem extends StatefulWidget {
  static const String routeName = 'edit_item';
  const EditItem({Key? key}) : super(key: key);

  @override
  State<EditItem> createState() => _EditItemState();
}

class _EditItemState extends State<EditItem> {
  late int counter;
  String groupValue ='';
  String isDesign ='';
  var textController = TextEditingController();
  bool image =true;
  void initState() {
    super.initState();
    counter=0; // Setting the initial value for the field.
  }
  @override
  Widget build(BuildContext context) {
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
                    'Edit Product',
                    style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600,color: Color(0xFF000000)),),
                  Spacer(),
                  IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(IconBroken.Close_Square))
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
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Text('${counter}'),
                              SizedBox(width: 70.w,),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  MaterialButton(
                                    padding: EdgeInsets.all(0),
                                    minWidth: 0,
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    child: Container(
                                        margin: EdgeInsets.all(0),
                                        padding: EdgeInsets.all(0),
                                        child: Icon(Icons.arrow_drop_up,)),
                                    onPressed: () {
                                      setState(() {
                                        counter++;
                                        // incrementing value
                                      });
                                    },
                                  ),
                                  MaterialButton(
                                    padding: EdgeInsets.all(0),
                                    minWidth: 0,
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    child: Container(
                                        margin: EdgeInsets.all(0),
                                        padding: EdgeInsets.all(0),
                                        child: Icon(Icons.arrow_drop_down,)),
                                    onPressed: () {
                                      setState(() {
                                        counter--;
                                        // incrementing value
                                      });
                                    },
                                  ),

                                ],
                              ),
                            ],
                          ),
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
                            type: TextInputType.text,
                            border: Colors.grey,
                            hint: 'ex: xl,s,m',

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
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Text('${counter}'),
                              SizedBox(width: 70.w,),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  MaterialButton(
                                    padding: EdgeInsets.all(0),
                                    minWidth: 0,
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    child: Container(
                                        margin: EdgeInsets.all(0),
                                        padding: EdgeInsets.all(0),
                                        child: Icon(Icons.arrow_drop_up,)),
                                    onPressed: () {
                                      setState(() {
                                        counter++;
                                        // incrementing value
                                      });
                                    },
                                  ),
                                  MaterialButton(
                                    padding: EdgeInsets.all(0),
                                    minWidth: 0,
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    child: Container(
                                        margin: EdgeInsets.all(0),
                                        padding: EdgeInsets.all(0),
                                        child: Icon(Icons.arrow_drop_down,)),
                                    onPressed: () {
                                      setState(() {
                                        counter--;
                                        // incrementing value
                                      });
                                    },
                                  ),

                                ],
                              ),
                            ],
                          ),
                        ),
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
              Row(
                children: [
                  StatusContainer('S',false),
                  StatusContainer('XS',false),
                  StatusContainer('M',false),
                  StatusContainer('L',false),
                  StatusContainer('XL',false),
                  StatusContainer('XXL',false),
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
                  StatusContainer('In stock',true, background: Colors.amber),
                  StatusContainer('Out of stock',true, background: Colors.red),
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
                            value: 'male',
                            groupValue: groupValue,
                            onChanged: (value)
                        {
                          //cubit fun her
                          setState(() {
                            groupValue = value!;
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
                        Radio(activeColor: CustomColors.blue,value: 'female', groupValue: groupValue, onChanged: (value)
                        {
                          //cubit fun her
                          setState(() {
                            groupValue = value!;
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
                        Radio(activeColor: CustomColors.blue,value: 'unisex', groupValue: groupValue, onChanged: (value)
                        {
                          //cubit fun her
                          setState(() {
                            groupValue = value!;
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
                    controller:textController,
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
                child: Row(
                  children: [
                    StatusContainer('Black',true, background: Colors.black),
                    StatusContainer('Red',true, background: Colors.red),
                    StatusContainer('Green',true, background: Colors.green),
                    StatusContainer('Blue',true, background: Colors.blue),
                    StatusContainer('White',true, background: Colors.white),
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

                mainAxisAlignment: image?MainAxisAlignment.start : MainAxisAlignment.center,
                children: [
                  if(image)
                    Container(
                    height: 90.h,
                    width: 90.w,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      image:
                      DecorationImage
                        (image:
                      NetworkImage('https://img.freepik.com/free-photo/portrait-man-white-shirt_171337-11986.jpg'),
                        fit: BoxFit.cover

                      ),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black)
                    ),
                  ),
                  if(image)
                    SizedBox(width: 10.w,),
                  CustomButton(
                      icon: IconBroken.Upload,
                      iconColor: Colors.white,
                      radius: 12,
                      width: 195.w,
                      height: 50.h,
                      backgroundColor: CustomColors.blue,
                      text: 'change an photo',
                      func: (){},
                      style: Styles.textStyle16.copyWith(color: Colors.white)
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
