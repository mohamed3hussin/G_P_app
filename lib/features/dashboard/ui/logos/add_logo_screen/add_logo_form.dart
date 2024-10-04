import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import '../../../../../core/colors/colors.dart';
import '../../../../../core/shared_widget/custom_button.dart';
import '../../../../../core/text_style/styles.dart';
import '../../../logic/dashBoardCubit/dashboard_cubit.dart';


class AddLogoForm extends StatefulWidget {
  final DashboardCubit cubit;

  const AddLogoForm({Key? key, required this.cubit}) : super(key: key);

  @override
  _AddLogoFormState createState() => _AddLogoFormState();
}

class _AddLogoFormState extends State<AddLogoForm> {
  final _formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var dateController = TextEditingController();
  var quantityController = TextEditingController();
  var priceController = TextEditingController();
  File? imagePicked;
  bool _imagePickedError = false;

  Future pickImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      imagePicked = File(image!.path);
      _imagePickedError = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildTextField('Logo name', 'ex: adidas', nameController, TextInputType.text),
          SizedBox(height: 15.h),
          _buildRowFields(),
          SizedBox(height: 15.h),
          _buildImagePicker(),
          SizedBox(height: 15.h),
          _buildUploadButton(),
          SizedBox(height: 20.h),
          _buildSubmitButton(),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String hint, TextEditingController controller, TextInputType inputType) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w400, color: const Color(0xFF270008)),
        ),
        SizedBox(height: 5.h),
        TextFormField(
          controller: controller,
          keyboardType: inputType,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: hint,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $label';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildRowFields() {
    return Row(
      children: [
        Expanded(child: _buildTextField('Date of creation', 'mm/dd/yyyy', dateController, TextInputType.datetime)),
        SizedBox(width: 10.w),
        Expanded(child: _buildTextField('Logo price', '0-99', priceController, TextInputType.number)),
      ],
    );
  }

  Widget _buildImagePicker() {
    return GestureDetector(
      onTap: pickImageFromGallery,
      child: Container(
        height: 100.h,
        decoration: BoxDecoration(
          border: Border.all(color: _imagePickedError ? Colors.red : CustomColors.grey),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: imagePicked != null
            ? Image.file(imagePicked!)
            : Center(child: Text('Pick an image', style: Styles.textStyle14.copyWith(color: CustomColors.grey))),
      ),
    );
  }

  Widget _buildUploadButton() {
    return CustomButton(
      icon: Icons.upload,
      iconColor: Colors.white,
      radius: 12,
      width: 195.w,
      height: 50.h,
      backgroundColor: CustomColors.blue,
      text: 'Upload a logo',
      func: pickImageFromGallery,
      style: Styles.textStyle16.copyWith(color: Colors.white),
    );
  }

  Widget _buildSubmitButton() {
    return CustomButton(
      icon: Icons.add,
      iconColor: Colors.white,
      radius: 12,
      width: 195.w,
      height: 50.h,
      backgroundColor: CustomColors.blue,
      text: 'Add Logo',
      func: () async {
        if (_formKey.currentState!.validate()) {
          if (imagePicked == null) {
            setState(() {
              _imagePickedError = true;
            });
          } else {
            await widget.cubit.createLogo({
              'Name': nameController.text,
              'Cost': priceController.text,
              'Quantity': quantityController.text,
              'PictureUrl': await MultipartFile.fromFile(
                imagePicked!.path,
                filename: imagePicked!.path.split('/').last,
                contentType: MediaType("image", "jpeg"),
              ),
            });
            Navigator.pop(context);
          }
        }
      },
      style: Styles.textStyle16.copyWith(color: Colors.white),
    );
  }
}
