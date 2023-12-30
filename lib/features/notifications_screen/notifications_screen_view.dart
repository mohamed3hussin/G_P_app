import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/core/helper/hundel_size.dart';
import '../../core/assets_data/iconBroken.dart';
import '../../core/colors/colors.dart';
import '../../core/text_style/styles.dart';
import 'no_notification_screen.dart';

class NotificationScreenView extends StatefulWidget {
  static const String routeName = 'notification_screen';

  NotificationScreenView({Key? key}) : super(key: key);

  @override
  State<NotificationScreenView> createState() => _NotificationScreenViewState();
}

class _NotificationScreenViewState extends State<NotificationScreenView> {
  bool isNotification = false;
  List<NotificationModel>list=[
    NotificationModel(
        text: 'Your package is being delivered by courier',
        time: '12:00 AM',
        image: AssetsData.deliveredImage,
        isRead: false),
    NotificationModel(
        text: 'Your package is being packed by the sender',
        time: '12:00 AM',
        image: AssetsData.packedImage,
        isRead: false),
    NotificationModel(
        time: '12:00 AM',
        text: 'Your package has arrived at your destination',
        image: AssetsData.arrivedImage,
        isRead: false),
    NotificationModel(
        time: '12:00 AM',
        text: 'Your package is being delivered by courier',
        image: AssetsData.deliveredImage,
        isRead: false),
    NotificationModel(
        time: '12:00 AM',
        text: 'Your package is being packed by the sender',
        image: AssetsData.packedImage,
        isRead: true),
    NotificationModel(
        time: '12:00 AM',
        text: 'Your package has arrived at your destination',
        image: AssetsData.arrivedImage,
        isRead: true),
    NotificationModel(
        time: '12:00 AM',
        text: 'Your package is being delivered by courier',
        image: AssetsData.deliveredImage,
        isRead: false),
    NotificationModel(
        time: '12:00 AM',
        text: 'Your package is being packed by the sender',
        image: AssetsData.packedImage,
        isRead: true),
    NotificationModel(
        time: '12:00 AM',
        text: 'Your package has arrived at your destination',
        image: AssetsData.arrivedImage,
        isRead: true),
    NotificationModel(
        time: '12:00 AM',
        text: 'Your package is being delivered by courier',
        image: AssetsData.deliveredImage,
        isRead: true),
    NotificationModel(
        time: '12:00 AM',
        text: 'Your package is being packed by the sender',
        image: AssetsData.packedImage,
        isRead: true),
    NotificationModel(
        time: '12:00 AM',
        text: 'Your package has arrived at your destination',
        image: AssetsData.arrivedImage,
        isRead: true),
  ];
  List<String> taps = ['All Notification','Unread'];
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar:AppBar(
          toolbarHeight: 90.h,
          backgroundColor: Color(0xFFEFF1F8),
          leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(IconBroken.Arrow___Left_2,color: CustomColors.blue,),),
          title: Text('Notification'),
          titleTextStyle: Styles.textStyle24.copyWith(color: CustomColors.darkBlue,fontWeight: FontWeight.w700),
          centerTitle: true,
          actions:
          [
            IconButton(onPressed: (){}, icon: Icon(IconBroken.Search,color: Color(0xFF1B72C0),size: 30,)),
            IconButton(onPressed: (){}, icon: Icon(IconBroken.Buy,color: Color(0xFF1B72C0),size: 30,))
          ],
        ),
        body: isNotification? Column(
          children:
          [
            TabBar(
                labelStyle:Styles.textStyle14.copyWith(color: CustomColors.darkGrey,fontWeight: FontWeight.w600),
                unselectedLabelStyle:
                Styles.textStyle14.copyWith(color: CustomColors.darkGrey),
                labelColor: CustomColors.darkGrey,
                indicatorColor: CustomColors.darkBlue,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs:
            [
              Tab(child: Text('All Notification'),),
              Tab(child: Text('Unread',),),
            ]),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w,vertical: 20.h),
                child: TabBarView(
                  children: <Widget>[
                    ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context,index)
                        {
                          return AllNotification(list[index]);
                        },
                        separatorBuilder:((context, index) {
                          return SizedBox(height: 10.h,);
                        }),
                        itemCount: list.length),
                    ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context,index)
                        {
                          List read = [];
                          list.forEach((element)
                          {
                            if(!element.isRead)
                            {
                              read.add(element);
                            }
                          });
                          return AllNotification(read[index]);
                        },
                        separatorBuilder:((context, index) {
                          return SizedBox(height: 10.h,);
                        }),
                        //محتاجه cubit عشان تبقي مظبوطه
                        itemCount: 5),
                  ],
                ),
              ),
            ),
          ],
        ):NoNotification(context),
      ),
    );
  }
}
Widget AllNotification(NotificationModel model)=>Column(
  children:
  [
    Material(
      elevation: 1,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 100.h,
        decoration: BoxDecoration(
          color: model.isRead?Colors.white : CustomColors.lightGrey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 12.w,vertical: 5.h),
          child: Row(
            children:
            [
              if(!model.isRead)
                CircleAvatar(radius: 2,backgroundColor: Colors.red,),
                SizedBox(width: 7.w,),
              Stack(
                alignment: AlignmentDirectional.center,
                children:
                [
                  CircleAvatar(
                    radius: 25.r,
                    backgroundColor: Colors.black,
                  ),
                  CircleAvatar(
                    radius: 24.r,
                    backgroundColor: CustomColors.lightGrey,
                    child: SvgPicture.asset(
                      model.image,
                      width: 30.w,
                      height: 30.h,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20.w,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  SizedBox(
                    child: Text(
                      model.text,
                      maxLines: 2,
                      style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w400,color: CustomColors.textColor),),
                    width: 200.w,
                  ),
                  SizedBox(height: 10.h,),
                  Text(model.time,style: Styles.textStyle12.copyWith(fontWeight: FontWeight.w400),)
                ],
              ),
            ],
          ),
        ),
      ),
    )
  ],
);

class NotificationModel
{
  final String text;
  final String image;
  final bool isRead;
  final String time;

  NotificationModel( {required this.text,required this.image,required this.isRead,required this.time});
}
