import 'dart:io';
import 'package:g_p_app/data/model/response/LogoResponse.dart';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/features/dashboard/dashBoardCubit/dash_board_cubit.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/assets_data/iconBroken.dart';
import '../../../core/colors/colors.dart';
import '../../../core/shared_widget/custom_button.dart';
import '../../../core/shared_widget/default_text.dart';
import '../../../core/text_style/styles.dart';
import '../dashBoardCubit/dash_board_state.dart';

class EditLogo extends StatefulWidget {
  static const String routeName = 'edit_logo';
  String logoName;
  String logoPrice;
  String productQuantity;
  int logoId;
  String networkImage;

  EditLogo(this.logoName, this.logoPrice, this.productQuantity, this.logoId,this.networkImage);

  @override
  State<EditLogo> createState() => _EditLogoState();
}

class _EditLogoState extends State<EditLogo> {
  var nameController = TextEditingController();
  var quantityController = TextEditingController();
  var priceController = TextEditingController();
  bool image =true;
  File? imagePicked ;
  Future pickImageFromGallery()async
  {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      imagePicked = File(image!.path);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.text = widget.logoName;
    quantityController.text = widget.productQuantity;
    priceController.text = widget.logoPrice;

  }
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<DashBoardCubit,DashBoardState>(
      listener: (context,state) {},
      builder: (context,state)
      {
        var cubit = DashBoardCubit.get(context);
        return Scaffold(
          body: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w,vertical: 30.h),
            child: Column(

              children:
              [
                Row(
                  children:
                  [
                    Text(
                      'Edit Logo',
                      style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600,color: Color(0xFF000000)),),
                    Spacer(),
                    IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(IconBroken.Close_Square))
                  ],
                ),
                SizedBox(height: 10.h,),
                Center(
                  child: Container(
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
                        Image(image: NetworkImage(widget.networkImage ??
                            ''),fit: BoxFit.cover,)
                      ],
                    ),
                  ),
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
                                'logo name',
                                style: Styles.textStyle14.copyWith(
                                    fontWeight: FontWeight.w400,color: Color(0xFF270008)),),
                              alignment: AlignmentDirectional.topStart,
                            ),
                            SizedBox(height: 5.h,),
                            defaultTextField(
                              controller: nameController,
                              type: TextInputType.text,
                              border: Colors.grey,
                              hint: 'ex: adidas',

                            ),
                          ],
                        )),
                    SizedBox(width: 10.w,),
                    Column(
                      children: [
                        Align(
                          child: Text(
                            'logo Quantity',
                            style: Styles.textStyle14.copyWith(
                                fontWeight: FontWeight.w400,color: Color(0xFF270008)),),
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
                                'logo price',
                                style: Styles.textStyle14.copyWith(
                                    fontWeight: FontWeight.w400,color: Color(0xFF270008)),),
                              alignment: AlignmentDirectional.topStart,
                            ),
                            SizedBox(height: 7.h,),
                            Container(
                              width: 90.w,
                              child: defaultTextField(
                                controller: priceController,
                                type:TextInputType.number,
                                hint: '0-99',
                                border: Colors.grey,
                              ),
                            ),
                          ],
                        ),),
                  ],
                ),
                SizedBox(height: 15.h,),
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
                  SizedBox(height: 15.h,),
                CustomButton(
                    icon: IconBroken.Upload,
                    iconColor: Colors.white,
                    radius: 12,
                    width: 195.w,
                    height: 50.h,
                    backgroundColor: CustomColors.blue,
                    text: 'Upload a logo',
                    func: ()
                    {
                      pickImageFromGallery();
                    },
                    style: Styles.textStyle16.copyWith(color: Colors.white)
                ),
                SizedBox(height: 20.h,),
                CustomButton(
                    icon: IconBroken.Plus,
                    iconColor: Colors.white,
                    radius: 12,
                    width: 195.w,
                    height: 50.h,
                    backgroundColor: CustomColors.blue,
                    text: 'Edit Logo',
                    func: ()
                    async {
                      if(imagePicked != null)
                      {
                        cubit.editLogo(widget.logoId.toString(),
                            {
                              'Name':nameController.text,
                              'Cost':priceController.text,
                              'Quantity':quantityController.text,
                              'PictureUrl':await MultipartFile.fromFile(
                                imagePicked!.path
                                ,filename: imagePicked!.path.split('/').last,
                                contentType: MediaType("image", "jpeg"),),
                            });
                      }
                      else
                      {
                        cubit.editLogo(widget.logoId.toString(),
                            {
                              'Name':nameController.text,
                              'Cost':priceController.text,
                              'Quantity':quantityController.text,
                            });
                      }
                    },
                    style: Styles.textStyle16.copyWith(color: Colors.white)
                ),
              ],
            ),
          ),
        );
      },

    );
  }
}
