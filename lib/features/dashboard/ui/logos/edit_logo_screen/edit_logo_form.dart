import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../logic/dashBoardCubit/dashboard_cubit.dart';

class EditLogoForm extends StatefulWidget {
  final String logoName;
  final String productQuantity;
  final String logoPrice;
  final String networkImage;
  final DashboardCubit cubit;
  final GlobalKey<FormState> formKey;
  final int logoId;

  const EditLogoForm({
    required this.logoName,
    required this.productQuantity,
    required this.logoPrice,
    required this.networkImage,
    required this.cubit,
    required this.formKey,
    required this.logoId,
    Key? key,
  }) : super(key: key);

  @override
  _EditLogoFormState createState() => _EditLogoFormState();
}

class _EditLogoFormState extends State<EditLogoForm> {
  final nameController = TextEditingController();
  final quantityController = TextEditingController();
  final priceController = TextEditingController();
  File? imagePicked;
  bool _imagePickedError = false;

  @override
  void initState() {
    super.initState();
    nameController.text = widget.logoName;
    quantityController.text = widget.productQuantity;
    priceController.text = widget.logoPrice;
  }

  Future pickImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        imagePicked = File(image.path);
        _imagePickedError = false;
      } else {
        _imagePickedError = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: pickImageFromGallery,
          child: Container(
            height: 100.h,
            decoration: BoxDecoration(
              border: Border.all(color: _imagePickedError ? Colors.red : Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: imagePicked != null
                ? Image.file(imagePicked!)
                : Image.network(widget.networkImage, fit: BoxFit.cover),
          ),
        ),
        if (_imagePickedError)
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                'Please pick an image',
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
          ),
        SizedBox(height: 15.h),
        _buildTextField(nameController, 'Logo Name', 'ex: adidas'),
        SizedBox(height: 10.h),
        _buildTextField(quantityController, 'Quantity', '0-99'),
        SizedBox(height: 10.h),
        _buildTextField(priceController, 'Price', '0-99'),
        const SizedBox(height: 20),
        _buildActionButtons(),
      ],
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 5.h),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(hintText: hint),
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

  Widget _buildActionButtons() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            pickImageFromGallery();
          },
          child: const Text('Upload Logo'),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            if (widget.formKey.currentState!.validate()) {
              if (imagePicked != null) {
                widget.cubit.editLogo(widget.logoId.toString(), {
                  'Name': nameController.text,
                  'Cost': priceController.text,
                  'Quantity': quantityController.text,
                  // Assuming you handle the image here
                });
              } else {
                widget.cubit.editLogo(widget.logoId.toString(), {
                  'Name': nameController.text,
                  'Cost': priceController.text,
                  'Quantity': quantityController.text,
                });
              }
              Navigator.pop(context);
            }
          },
          child: const Text('Edit Logo'),
        ),
      ],
    );
  }
}
