import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/colors/colors.dart';
import '../../../core/text_style/styles.dart';

IconButton getMachineModel(context,{required String name, required String type, required String imagePath,double ratio=1/1.1}){
  return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 400.h,
                decoration: BoxDecoration(
                    color: CustomColors.lightGrey,
                    borderRadius: BorderRadius.circular(25.r)
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.all(7.h),
                          width: 35.w,
                          height: 5.h,
                          decoration: BoxDecoration(
                              color: CustomColors.darkGrey,
                              borderRadius: BorderRadius.circular(3.r)),
                        ),
                      ),
                      Text(name,style: Styles.textStyle20,),
                      Text(type,style: Styles.textStyle16),
                      Expanded(
                        child: GridView.count(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            crossAxisCount: 2,
                            mainAxisSpacing: 3,
                            crossAxisSpacing: 3,
                            childAspectRatio: ratio,
                            children: List.generate(5,
                                  (index) => Image.network(imagePath),
                            )),
                      )
                    ],
                  ),
                ),
              );
            });
      },
      icon: CircleAvatar(
        radius: 25.w,
        backgroundColor: Colors.white,
        child: Center(
          child: Icon(
            Icons.camera_alt_outlined,
            color: CustomColors.blue,
            size: 40.w,
          ),
        ),
      ));
}