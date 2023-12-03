import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/core/assets_data/iconBroken.dart';
import 'package:g_p_app/core/text_style/styles.dart';

import '../../../../../core/shared_widget/custom_button.dart';

class HomeScreen extends StatelessWidget {
  List<String> carouselList = [
    '${AssetsData.carouselImage}',
    '${AssetsData.carouselImage2}',
    '${AssetsData.carouselImage3}',
  ];
  List<CategoriesModel> categoriesModel = [
    CategoriesModel(AssetsData.manCategoriesImage, 'Man'),
    CategoriesModel(AssetsData.womenCategoriesImage, 'Women'),
    CategoriesModel(AssetsData.kidsCategoriesImage, 'Kids'),
    CategoriesModel(AssetsData.accessoriesCategoriesImage, 'Accessories'),
  ];

   HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.symmetric(vertical: 10.h),
              child: CarouselSlider(
                  items: carouselList.map((e) =>
              Container(

                child: Image(image: AssetImage('${e.toString()}'),
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              )).toList(), options: CarouselOptions(
                height: 140.h,
                initialPage: 0,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                reverse: false,
                scrollDirection: Axis.horizontal,

              ) ,
              ),
            ),
            Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xFFD3E4FF))
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Unleash your creativity',
                            style: Styles.textStyle14.copyWith(color: Color(0xFF1B72C0)),),
                          Text(
                            'and fashion sense.',
                            style: Styles.textStyle14.copyWith(color: Color(0xFF1B72C0)),),
                          SizedBox(height: 10.h,),
                          CustomButton(
                            backgroundColor: const Color(0xFF1B72C0),
                            text: 'Design Your Shirt Now!',
                            func: () {  }, style: Styles.textStyle14.copyWith(color: Colors.white,fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Image(image: AssetImage(AssetsData.designButtonImage),)
                ],
              ),
            ),
            SizedBox(height: 5.h,),
            Row(
              children: [
                Text(
                  'Categories',
                  style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w700,color: Color(0xFF1B72C0)),),
                Spacer(),
                TextButton(
                    onPressed: (){},
                    child: Text('SEE ALL',
                      style: Styles.textStyle12.copyWith(color: Color(0xFF44474E),fontWeight: FontWeight.w500),),

                ),

              ],
            ),
            Container(
              height: 130,
              child: ListView.separated(
                  physics:BouncingScrollPhysics() ,
                  scrollDirection: Axis.horizontal,
                  itemBuilder:(context,index)=> CategoriesList(categoriesModel[index]),
                  separatorBuilder: (context,index)=>SizedBox(width: 10,),
                  itemCount: categoriesModel.length
              ),
            ),
            Row(
              children: [
                Text(
                  'For You',
                  style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w700,color: Color(0xFF1B72C0)),),
                Spacer(),
                TextButton(
                  onPressed: (){},
                  child: Text('SEE ALL',
                    style: Styles.textStyle12.copyWith(color: Color(0xFF44474E),fontWeight: FontWeight.w500),),

                ),

              ],
            ),
            Container(
              color: Colors.white,
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1/1.49,
                children: List.generate(
                    8,
                        (index) => ItemBuilder(context)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget CategoriesList(CategoriesModel model)=>Column(
    children: [
      Stack(
        alignment: AlignmentDirectional.center,
        children: [
          CircleAvatar(
            radius: 48.0,
            backgroundColor: Colors.black,
          ),
          CircleAvatar(
            radius: 47.0,
            backgroundColor: Colors.white,
          ),
          CircleAvatar(
            radius: 45.0,
            backgroundImage: AssetImage(model.image),
            backgroundColor: Colors.grey[300],
          ),
        ],
      ),
      SizedBox(height: 5.h,),
      Text(
        '${model.title}',
        style: Styles.textStyle14.copyWith(color: Color(0xFF001C38),fontWeight: FontWeight.w500),
      ),
    ],
  );
  Widget ItemBuilder(context)=>Material(
    borderRadius: BorderRadius.circular(12),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 1,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Image(
              image: NetworkImage('https://img.freepik.com/free-photo/portrait-man-white-shirt_171337-11986.jpg'),
              width: double.infinity,

            ),
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: ()
                {},
                icon: CircleAvatar(
                  radius: 20.w,
                  backgroundColor: Colors.grey[200],
                  child: Icon(
                    IconBroken.Heart,
                    color:Color(0xFFEA3A3D),
                    size: 30.w,
                  ),
                )),
          ],
        ),
        SizedBox(height: 5.h,),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
               'Shirt',
                style: Styles.textStyle12.copyWith(color: Color(0xFF1B72C0),fontWeight: FontWeight.w500)
              ),
              SizedBox(height: 5.h,),
              Text(
                'EGP 480',
                style: Styles.textStyle14.copyWith(color: Colors.black,fontWeight: FontWeight.w500)
              ),
              Row(
                children: [
                  Text(
                      'EGP 600',
                      style: Styles.textStyle12.copyWith(color: Colors.grey,decoration: TextDecoration.lineThrough),
                    ),
                  SizedBox(width: 2.w,),
                  Text(
                      '20% OFF',
                      style: Styles.textStyle14.copyWith(color: Color(0xFF117828),fontWeight: FontWeight.w500)
                  ),
                ],
              ),
              SizedBox(height: 5.h,),
              Row(
                children:
                [

                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      CircleAvatar(
                        radius: 6.0.w,
                        backgroundColor: Colors.black,

                      ),
                      CircleAvatar(
                        radius: 5.0.w,
                        backgroundColor: Colors.white,

                      ),
                    ],
                  ),
                  SizedBox(width: 3.w,),
                  CircleAvatar(
                    radius: 6.0.w,
                    backgroundColor: Colors.blueAccent,

                  ),
                  SizedBox(width: 3.w,),
                  CircleAvatar(
                    radius: 6.0.w,
                    backgroundColor: Colors.amber,

                  ),
                  SizedBox(width: 3.w,),
                  CircleAvatar(
                    radius: 6.0.w,
                    backgroundColor: Colors.green,

                  ),

                ],
              ),
              Row(
                children: [
                  Icon(Icons.star,color: Colors.amber,),
                  SizedBox(width: 2.w,),
                  Text('4.5',style: Styles.textStyle12.copyWith(color: Colors.black,fontWeight: FontWeight.w400),),
                  SizedBox(width: 2.w,),
                  Text('(72)',style: Styles.textStyle12.copyWith(color: Colors.black,fontWeight: FontWeight.w400),),
                  Spacer(),
                  IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: ()
                      {},
                      icon: CircleAvatar(
                        radius: 20.w,
                        backgroundColor: Color(0xFF1B72C0),
                        child: Icon(
                          IconBroken.Bag_2,
                          color:Colors.white,
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
class CategoriesModel
{
  final String image;
  final String title;


  CategoriesModel(this.image, this.title);
}
