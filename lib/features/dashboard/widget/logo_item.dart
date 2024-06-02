import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';

import 'delete_alert.dart';
import 'edit_logo.dart';
//
// class LogoItem extends StatelessWidget {
//   const LogoItem({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 350,
//       height: 80,
//       padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 10.h),
//       margin: EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16.r),
//         color: CustomColors.lightGrey,
//       ),
//       child: Row(
//         children: [
//           Text('1',style: Styles.textStyle14,),
//           SizedBox(width: 8.w,),
//           Container(
//             width: 42,
//             height: 42,
//             decoration: ShapeDecoration(
//               image: DecorationImage(
//                 image:AssetImage('assets/images/image 2.png'),
//                 fit: BoxFit.cover,
//               ),
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//             ),
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   SizedBox(width: 8.w,),
//                   Text('Adidas',style: Styles.textStyle14!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),),
//                   SizedBox(width: 16.w,),
//                   Text('99.99',style: Styles.textStyle14!.copyWith(color: Colors.green),),
//                   SizedBox(width: 85.w,),
//                   Row(
//                     children: [
//                       Container(
//                         width: 25,
//                         height: 25,
//                         decoration: BoxDecoration(
//                           color: Color(0xFFFCFCFC),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Color(0x3F000000),
//                                 blurRadius: 6.60,
//                                 offset: Offset(2, 4),
//                                 spreadRadius: 0,
//                               )
//                             ],
//                           borderRadius: BorderRadius.circular(50.r)
//                         ),
//                         child: InkWell(
//                           onTap: ()=>Navigator.of(context).pushNamed(EditLogo.routeName),
//                             child: Icon(Icons.edit,color: Color(0xFFF8B84E),size: 21,)),
//                       ),
//                       SizedBox(width: 8.w,),
//                       InkWell(
//                         onTap: () {
//                           showDialog(
//                             context: context,
//                             builder: (context)
//                             =>
//                                 Dialog(
//                                   child: DeleteItemAlert(
//                                       'Want To delete this Logo ?',
//                                       'You will delete this logo if you click the delete button'),
//                                 ),
//                           );
//                         },
//                         child: Container(
//                           width: 25,
//                           height: 25,
//                           decoration: BoxDecoration(
//                               color: Color(0xFFFCFCFC),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Color(0x3F000000),
//                                   blurRadius: 6.60,
//                                   offset: Offset(2, 4),
//                                   spreadRadius: 0,
//                                 )
//                               ],
//                               borderRadius: BorderRadius.circular(50.r)
//                           ),
//                           child: Icon(Icons.delete_forever_outlined,color: CustomColors.red,size: 22,),
//                         ),
//                       ),                    ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 8.h,),
//               Row(
//                 children: [
//                   SizedBox(width: 8.w,),
//                   Text('15-1-2023',style: Styles.textStyle12,),
//                   SizedBox(width: 15.w,),
//                   Text('Quantity : 50',style: Styles.textStyle12),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
