import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/assets_data/iconBroken.dart';
import '../../../core/colors/colors.dart';
import '../../../core/shared_widget/custom_button.dart';
import '../../../core/shared_widget/default_text.dart';
import '../../../core/text_style/styles.dart';

class EditLogo extends StatefulWidget {
  static const String routeName = 'edit_logo';
  const EditLogo({Key? key}) : super(key: key);

  @override
  State<EditLogo> createState() => _EditLogoState();
}

class _EditLogoState extends State<EditLogo> {
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
            Row(
              children: [
                Expanded(
                    child:
                    Column(
                      children: [
                        Align(
                          child: Text(
                            'logo name',
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
                        'logo Quantity',
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
                            'Date of creation',
                            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w400,color: Color(0xFF270008)),),
                          alignment: AlignmentDirectional.topStart,
                        ),
                        SizedBox(height: 5.h,),
                        defaultTextField(
                          type: TextInputType.datetime,
                          border: Colors.grey,
                          hint: 'mm/dd/yyyy',

                        ),
                      ],
                    )),
                SizedBox(width: 10.w,),
                Column(
                  children: [
                    Align(
                      child: Text(
                        'logo price',
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
            if(image)
              Container(
              width: 70.w,
              height: 70.h,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:NetworkImage('https://mostaql.hsoubcdn.com/uploads/thumbnails/845832/5fc67c65f2e65/b6e2ef894ef8e63a8a3e8c35a6e6144a.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)
              ),
            ),
            if(image)
              SizedBox(height: 15.h,),
            CustomButton(
                icon: IconBroken.Upload,
                iconColor: Colors.white,
                radius: 12,
                width: 195.w,
                height: 50.h,
                backgroundColor: CustomColors.blue,
                text: 'change a logo',
                func: (){},
                style: Styles.textStyle16.copyWith(color: Colors.white)
            ),
          ],
        ),
      ),
    );
  }
}
