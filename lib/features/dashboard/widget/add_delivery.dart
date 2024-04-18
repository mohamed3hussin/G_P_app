import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/features/dashboard/widget/satus_container.dart';

import '../../../core/assets_data/iconBroken.dart';
import '../../../core/colors/colors.dart';
import '../../../core/shared_widget/default_text.dart';
import '../../../core/text_style/styles.dart';

class AddDelivery extends StatefulWidget {
  static const String routeName = 'add_delivery';
  const AddDelivery({Key? key}) : super(key: key);

  @override
  State<AddDelivery> createState() => _AddDeliveryState();
}

class _AddDeliveryState extends State<AddDelivery> {
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
                  'Add Delivery Method ',
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
                            'Short name',
                            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w400,color: Color(0xFF270008)),),
                          alignment: AlignmentDirectional.topStart,
                        ),
                        SizedBox(height: 5.h,),
                        defaultTextField(
                          type: TextInputType.text,
                          border: Colors.grey,
                          hint: 'ex: ups3',

                        ),
                      ],
                    )),
                SizedBox(width: 10.w,),
                Column(
                  children: [
                    Align(
                      child: Text(
                        'Cost',
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
                'Delivery Time',
                style: Styles.textStyle14.copyWith(color: CustomColors.textColor,fontWeight: FontWeight.w400),
              ),
              alignment: AlignmentDirectional.topStart,
            ),
            SizedBox(height: 5.h,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  StatusContainer('1-2 Days',false),
                  StatusContainer('2-5 Days',false),
                  StatusContainer('5-10 Days',false),
                  StatusContainer('1-2 Weeks',false),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
