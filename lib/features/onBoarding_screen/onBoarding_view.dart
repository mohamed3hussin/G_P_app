import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/core/cach_helper/cach_helper.dart';
import 'package:g_p_app/core/helper/hundel_size.dart';
import 'package:g_p_app/features/login_screen/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


import '../../core/shared_widget/custom_navigation.dart';
import '../../core/text_style/styles.dart';
import 'onBoarding_model.dart';

class onBoardingView extends StatefulWidget {
  const onBoardingView({Key? key}) : super(key: key);

  @override
  State<onBoardingView> createState() => _onBoardingViewState();
}

class _onBoardingViewState extends State<onBoardingView> {
  List<onBoardingModel> model =
  [
    onBoardingModel(
        1,
        '${AssetsData.onBoardingImage_1}',
        'Search Your Favourite Product',
        'Find your favourite product in an easy and fast way'),
    onBoardingModel(
        2,
        '${AssetsData.onBoardingImage_2}',
        'Shopping And Add To Cart Product', ''),
    onBoardingModel(3,''
        '${AssetsData.onBoardingImage_3}'
        , 'Order arrivedsuccessfully', ''),
  ];
  var boardController = PageController();
  bool isLast = false;
  bool isMid = false;
  int count =0 ;
  void submit()
  {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value)
    {
      if(value){
        NavigationAndFinish(context, LoginScreenView());}
    });

  }
  @override
  Widget build(BuildContext context) {

    //760019
    return Scaffold(
      backgroundColor: Color(0xFFFDF1E2),
      body: Column(

        children:
        [
          Padding(
            padding:  EdgeInsetsDirectional.symmetric(vertical: context.deviceHeight/25,
                horizontal: context.deviceWidth/29),
            child: Align(
              alignment: AlignmentDirectional.topEnd,
              child: TextButton(
                onPressed: submit,
                child: Text('Skip',style:Styles.textStyle14.copyWith(color: Colors.black,fontWeight: FontWeight.w700)),),
            ),
          ),
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Container(
                margin: EdgeInsetsDirectional.symmetric(vertical: 60.h),
                child: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Container(
                    width: 20.w,
                    height: 200.h,
                    decoration: BoxDecoration(
                      color: Color(0xFFF77994),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft:Radius.circular(20) )
                    ),

                  ),
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.symmetric(vertical: 60.h),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Container(
                    width: 20.w,
                    height: 200.h,
                    decoration: BoxDecoration(
                        color: Color(0xFFF77994),
                        borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight:Radius.circular(20) )
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.center,
                child: Container(
                  width: 250.w,
                  height: 450.h,
                  child: PageView.builder(
                    controller: boardController ,
                    physics: BouncingScrollPhysics(),
                    onPageChanged: (index)
                    {
                      count = index;
                      if(index==model.length-1)
                      {
                        setState(() {
                          isLast=true;
                        });
                      }
                      else
                      {
                        setState(() {
                          isLast=false;

                        });

                      }
                    },
                    itemBuilder:(context,index)=>onBoardingItem(model[index],context),
                    itemCount: model.length,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h,),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
               if(model[count].id == 3)
                Container(
                child: SvgPicture.asset(
                    AssetsData.onBoardingLoadingImage_1,
                    width: 108.w,
                    height: 108.h,
                ),
              ),
              if(model[count].id == 2)
                Container(
                  width: 123.w,
                  height: 115.h,
                child: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: SvgPicture.asset(
                    AssetsData.onBoardingLoadingImage_2,
                    width: 119.w,
                    height: 108.h,
                  ),
                ),
              ),
              if(model[count].id == 1)
                Container(
                  width: 123.w,
                  height: 108.h,
                child: Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: SvgPicture.asset(
                    AssetsData.onBoardingLoadingImage_3,
                    width: 100.w,
                    height: 92.h,
                  ),
                ),
              ),
              OutlinedButton(
                  onPressed: ()
                  {
                    if(isLast)
                    {
                      submit();
                    }
                    else
                    {
                      boardController.nextPage(
                          duration: Duration(
                            milliseconds: 1500,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFFDF1E2)),
                    shape: const CircleBorder(),
                    padding: EdgeInsets.all(20.sp),
                    onPrimary: Colors.white,
                  ),
                  child: Container(
                    padding:EdgeInsets.all(20.sp) ,
                    decoration: BoxDecoration(
                      border:Border.all(width: 2,color: Color(0xFFC299A2)),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.arrow_forward_ios,color: Color(0xFF760019),) ,
                  ),
              ),
            ],
          ),
          // SmoothPageIndicator(
          //   controller: boardController,
          //   effect: WormEffect(
          //     activeDotColor: Colors.black,
          //     dotHeight: 5.0,
          //
          //   ),
          //   count: model.length,
          // ),


        ],
      ),
    );
  }
  Widget onBoardingItem(onBoardingModel model,context)=>Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children:
    [
      Container(
        width: 300.w,
          height: 320.h,
          child: Card(

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Align(
                alignment: AlignmentDirectional.bottomCenter,
                  child: Image(image: AssetImage('${model.image}'))))),
      Text('${model.title}',
        style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w900),),
      SizedBox(height: 20.h,),
      Text('${model.description}',
        style: Styles.textStyle16.copyWith(color: Colors.grey),
      ),

    ],
  );
}
