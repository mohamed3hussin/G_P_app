import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/core/helper/handle_size.dart';
import '../../core/cache_helper/cache_helper.dart';
import '../../core/text_style/styles.dart';
import '../authentication/login_screen/loginScreenView.dart';
import 'onBoarding_model.dart';

class onBoardingView extends StatefulWidget {
  const onBoardingView({Key? key}) : super(key: key);
  static const String routeName='on_boarding_view';

  @override
  State<onBoardingView> createState() => _onBoardingViewState();
}

class _onBoardingViewState extends State<onBoardingView> {
  List<onBoardingModel> model =
  [
    onBoardingModel(
        1,
        AssetsData.onBoardingImage_1,
        'Search Your Favourite Product',
        'Find your favourite product in an easy and fast way'),
    onBoardingModel(
        2,
        AssetsData.onBoardingImage_2,
        'Shopping And Add To Cart Product', 'Ease of shopping andproduct selection'),
    onBoardingModel(3,''
        '${AssetsData.onBoardingImage_3}'
        , 'Order arrived successfully', 'Deliver the order as soon as possible and successfully'),
  ];
  var boardController = PageController();
  bool isLast = false;
  bool isMid = false;
  double value =0.333 ;
  int count = 0 ;
  void submit()
  {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value)
    {
      if(value){
        Navigator.pushNamedAndRemoveUntil(context, LoginScreenView.routeName, (route) => false);}
    });

  }
  @override
  Widget build(BuildContext context) {

    //760019
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(

        children:
        [
          Padding(
            padding:  EdgeInsetsDirectional.symmetric(vertical: context.deviceHeight/20,
                horizontal: context.deviceWidth/29),
            child: Align(
              alignment: AlignmentDirectional.topEnd,
              child: TextButton(
                onPressed: submit,
                child: Text('Skip',style:Styles.textStyle14.copyWith(color: Colors.black,fontWeight: FontWeight.w700)),),
            ),
          ),
          SizedBox(
            width: 300.w,
            height: 500.h,
            child: PageView.builder(
              controller: boardController ,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (index)
              {
                  count = index;
                if(index==model.length-1)
                {
                  setState(() {
                    isLast=true;
                    if(model[count].id==3)
                    {
                      value= 1;
                    }
                  });
                }
                else
                {
                  setState(() {
                    isLast=false;
                    if(model[count].id==1)
                    {
                      value = 0.333;
                    }
                    if(model[count].id==2)
                    {
                      value= 0.666;
                    }


                  });

                }
              },
              itemBuilder:(context,index)=>onBoardingItem(model[index],context),
              itemCount: model.length,
            ),
          ),
          SizedBox(height: 50.h,),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Transform.scale(
              scale: 3,
              child:  CircularProgressIndicator(
              color: const Color(0xFF001C38),
              backgroundColor: const Color(0xFF1B72C0),
              value: value,
              strokeWidth: 3,
              )),
              OutlinedButton(
                  onPressed: ()
                  {
                    if(isLast)
                    {
                      submit();
                    }
                    else
                    {
                      if(model[count].id==1) {
                        setState(() {
                          value = 0.666;
                        });
                      }
                      if(model[count].id==2) {
                        setState(() {
                          value = 1;
                        });
                      }
                      boardController.nextPage(
                          duration: const Duration(
                            milliseconds: 1500,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, side: const BorderSide(color: Color(0xFFFDF1E2)),
                    shape: const CircleBorder(),
                  ),
                  child: Container(
                    padding:EdgeInsets.all(20.sp) ,
                    decoration: BoxDecoration(
                      border:Border.all(width: 2,color: const Color(0xFF1B72C0)),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.arrow_forward_ios,color: Color(0xFF001C38),) ,
                  ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget onBoardingItem(onBoardingModel model,context)=>Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children:
    [
      SizedBox(
        width: 300.w,
          height: 325.h,
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Align(
                alignment: AlignmentDirectional.bottomCenter,
                  child: Image(image: AssetImage(model.image))))),
      Padding(padding:EdgeInsets.all(8.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(model.title,
              style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w900,),textAlign: TextAlign.center,),
            SizedBox(height: 20.h,),
            Text('${model.description}',
              style: Styles.textStyle16.copyWith(color: const Color(0xFF44474E)),textAlign: TextAlign.center,
            ),
          ],
        ),
      ),


    ],
  );
}
